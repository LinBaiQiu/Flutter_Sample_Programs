import 'package:flutter/material.dart';

class TemperatureConversionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TemperatureConverterPage(),
    );
  }
}
class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  TextEditingController _celsiusController = TextEditingController();
  TextEditingController _fahrenheitController = TextEditingController();

  @override
  void dispose() {
    _celsiusController.dispose();
    _fahrenheitController.dispose();
    super.dispose();
  }
  

  void _convertCelsiusToFahrenheit(String text) {
    double? celsius = double.tryParse(text);
    if (celsius != null) {
      double fahrenheit = (celsius * 9 / 5) + 32;
      _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
    }
  }

  void _convertFahrenheitToCelsius(String text) {
    double? fahrenheit = double.tryParse(text);
    if (fahrenheit != null) {
      double celsius = (fahrenheit - 32) * 5 / 9;
      _celsiusController.text = celsius.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _celsiusController,
              decoration: InputDecoration(
                labelText: 'Celsius',
                suffix: Text('C'),
                
              ),
              keyboardType: TextInputType.number,
              onChanged: _convertCelsiusToFahrenheit,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _fahrenheitController,
              decoration: InputDecoration(
                labelText: 'Fahrenheit',
                suffix: Text('F'),
              ),
              keyboardType: TextInputType.number,
              onChanged: _convertFahrenheitToCelsius,
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

