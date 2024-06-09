import 'package:flutter/material.dart';
void main() {
  runApp(Prime());
}

class Prime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Number',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PrimePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PrimePage extends StatefulWidget {
  @override
  _PrimePageState createState() => _PrimePageState();
}

class _PrimePageState extends State<PrimePage> {
  TextEditingController _number = TextEditingController();
  String _message = '';
  List<int> prime = [];

  void calculatePrimes(int number) {
    prime.clear();
    for (var i = 2; i <= number; i++) {
      var isPrime = true;
      for (var j = 2; j <= i / 2; j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        prime.add(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prime Number'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _number,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int number = int.tryParse(_number.text) ?? 0;
                  calculatePrimes(number);
                  _message = 'Prime numbers before $number are: ${prime.join(", ")}';
                });
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
              child: Text("Calculate Prime Numbers"),
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
