import 'package:flutter/material.dart';

void main() {
  runApp(Year());
}

class Year extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leap Year',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: YearPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class YearPage extends StatefulWidget {
  @override
  _YearPageState createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  TextEditingController _yearController = TextEditingController();
  String _message = '';
  bool _testLeapYear(int year) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leap Year'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a year',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int year = int.tryParse(_yearController.text) ?? 0;
                setState(() {
                  if (year != 0) {
                    if (_testLeapYear(year)) {
                      _message = 'This year is a Leap year';
                    } else {
                      _message = 'This year is not a Leap year';
                    }
                  } else {
                    _message = 'Please enter a valid year';
                  }
                });
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
              child: Text("Check Leap Year"),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18),
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
