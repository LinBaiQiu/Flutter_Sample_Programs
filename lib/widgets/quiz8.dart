import 'package:flutter/material.dart';

void main() {
  runApp(LCSHomePage());
}

class LCSHomePage extends StatefulWidget {
  @override
  _LCSHomePageState createState() => _LCSHomePageState();
}

class _LCSHomePageState extends State<LCSHomePage> {
  final TextEditingController _string1Controller = TextEditingController();
  final TextEditingController _string2Controller = TextEditingController();
  String _result = '';

  void _calculateLCS() {
    final String string1 = _string1Controller.text;
    final String string2 = _string2Controller.text;

    if (string1.isEmpty || string2.isEmpty) {
      setState(() {
        _result = 'Please enter valid strings.';
      });
      return;
    }

    int lcsLength = _longestCommonSubsequence(string1, string2);
    setState(() {
      _result = 'LCS Length is : $lcsLength';
    });
  }

  int _longestCommonSubsequence(String text1, String text2) {
    // Get the lengths of the input strings
    int m = text1.length;
    int n = text2.length;
    
    // Initialize  table with dimensions (m+1) x (n+1) and fill it with zeros
    List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));
    /*List.generate(m + 1, ...): Creates m + 1 rows.
     List.filled(n + 1, 0): Each row has n + 1 columns, all filled with 0.
    text1 = "cat"
    text2 = "hat"
         h  a  t
      c  0  0  0  0
      a  0  0  0  0
      t  0  0  0  0 */


    // Iterate through each character of both strings
    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            // If characters match, add 1 to the value from the previous characters
            if (text1[i - 1] == text2[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
            } else {
                // If characters don't match, take the maximum value from either
                // the previous row or the previous column
                dp[i][j] = dp[i - 1][j].max(dp[i][j - 1]);
            }
        }
    }
    // Return the length of the longest common subsequence
    return dp[m][n];
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Longest Common Subsequence (LCS)'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _string1Controller,
              decoration: InputDecoration(
                labelText: 'Enter first word',
              ),
            ),
            TextField(
              controller: _string2Controller,
              decoration: InputDecoration(
                labelText: 'Enter second word',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLCS,
              style: ElevatedButton.styleFrom(
               backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),            
              child: Text('Calculate LCS'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the home page
              },
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
                ),
              child: Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

// Extension method to add a max function to the int type
extension MaxExtension on int {
  int max(int other) => this > other ? this : other;
}
