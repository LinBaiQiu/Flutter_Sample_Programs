import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int first = 0, second = 0;
  String opp = "";
  String result = "", text = "";

  void btnClicked(String btnText) {
    setState(() {
      if (btnText == "C") {
        // Clear button pressed
        result = "";
        text = "";
        first = 0;
        second = 0;
      } else if (btnText == "+" || btnText == "-" || btnText == "*" || btnText == "/") {
        // Operator button pressed
        first = int.tryParse(text) ?? 0; // Using int.tryParse for safety
        result = "";
        opp = btnText;
      } else if (btnText == "=") {
        // Equal button pressed
        second = int.tryParse(text) ?? 0;
        if (opp == "+") {
          result = (first + second).toString();
        } else if (opp == "-") {
          result = (first - second).toString();
        } else if (opp == "*") {
          result = (first * second).toString();
        } else if (opp == "/") {
          if (second != 0) {
            result = (first / second).toString();
          } else {
            result = "Error"; // Handle division by zero
          }
        }
      } else {
        // Number button pressed
        result = (int.tryParse(text + btnText) ?? 0).toString();
      }
      text = result;
    });
  }

  Widget customOutlineButton(String value, Color color) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 300,
            height: 350,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.topRight,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    customOutlineButton("9", Colors.white),
                    customOutlineButton("8", Colors.white),
                    customOutlineButton("7", Colors.white),
                    customOutlineButton("+", Colors.blue[100]!),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    customOutlineButton("6", Colors.white),
                    customOutlineButton("5", Colors.white),
                    customOutlineButton("4", Colors.white),
                    customOutlineButton("-", Colors.blue[100]!),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    customOutlineButton("3", Colors.white),
                    customOutlineButton("2", Colors.white),
                    customOutlineButton("1", Colors.white),
                    customOutlineButton("*", Colors.blue[100]!),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    customOutlineButton("C", Colors.red[100]!),
                    customOutlineButton("0", Colors.white),
                    customOutlineButton("=", Colors.green[100]!),
                    customOutlineButton("/", Colors.blue[100]!),
                  ],
                ),
                SizedBox(height: 30),
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
        ),
      ),
    );
  }
}
