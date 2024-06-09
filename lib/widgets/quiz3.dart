import 'package:flutter/material.dart';

void main() {
  runApp(PalindromeApp());
}

class PalindromeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Palindrome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Palindrome extends StatefulWidget {
  @override
  _PalindromeState createState() => _PalindromeState();
}

class _PalindromeState extends State<Palindrome> {
  TextEditingController _text = TextEditingController();
  String _message = '';

  bool isPalindrome(String str) {
    String cleanStr = str.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    return cleanStr == cleanStr.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palindrome'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _text,
              decoration: InputDecoration(
                labelText: 'Enter a word',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String text = _text.text;
                  if (isPalindrome(text)) {
                    _message = 'This word is Palindrome';
                  } else {
                    _message = 'This word is NOT Palindrome';
                  }
                });
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
              child: Text("Check Palindrome"),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate to the new page
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
