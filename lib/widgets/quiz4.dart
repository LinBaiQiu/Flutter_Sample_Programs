import 'dart:math';
import 'package:flutter/material.dart';
void main() {
  runApp(Circle());
}
class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Intersection',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CirclePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}
class _CirclePageState extends State<CirclePage> {
  TextEditingController _x1Controller = TextEditingController();
  TextEditingController _y1Controller = TextEditingController();
  TextEditingController _r1Controller = TextEditingController();
  TextEditingController _x2Controller = TextEditingController();
  TextEditingController _y2Controller = TextEditingController();
  TextEditingController _r2Controller = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Intersection'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _x1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter x coordinate for circle one',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _y1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter y coordinate for circle one',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _r1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter radius for circle one',
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _x2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter x coordinate for circle two',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _y2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter y coordinate for circle two',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _r2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter radius of circle two',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double x1 = double.tryParse(_x1Controller.text) ?? 0;
                  double y1 = double.tryParse(_y1Controller.text) ?? 0;
                  double r1 = double.tryParse(_r1Controller.text) ?? 0;
                  double x2 = double.tryParse(_x2Controller.text) ?? 0;
                  double y2 = double.tryParse(_y2Controller.text) ?? 0;
                  double r2 = double.tryParse(_r2Controller.text) ?? 0;

                  double distance = sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));

                  if (distance <= (r1 - r2)) {
                    _message = 'Circle B is inside A';
                  } else if (distance <= (r2 - r1)) {
                    _message = 'Circle A is inside B';
                  } else if (distance < (r1 + r2)) {
                    _message = 'Circle intersects each other';
                  } else if (distance == (r1 + r2)) {
                    _message = 'Circle A and B are in touch with each other';
                  } else {
                    _message = 'Circles do not intersect each other';
                  }
                });
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
              child: Text("Calculate Circle Intersection"),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
