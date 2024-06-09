import 'package:flutter/material.dart';

void main() {
  runApp(Queue());
}

class Queue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Queue using Stacks',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QueuePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QueuePage extends StatefulWidget {
  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  TextEditingController _controller = TextEditingController();
  List<int> displayqueue = [];
  List<int> stack1 = [];
  List<int> stack2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Queue using Stacks'),
        backgroundColor: Color.fromARGB(255, 63, 134, 188), 
      ),
      body: Container(
        color: Colors.grey[200], // Gray background color
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int num = int.tryParse(_controller.text) ?? 0;
                    if (num != 0) {
                      setState(() {
                        enqueue(num);
                        _controller.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
                  child: Text('Enqueue'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      dequeue();
                    });
                  },
                  style: ElevatedButton.styleFrom(
               backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
            ),
                  child: Text('Dequeue'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Display Output :',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: displayqueue.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      displayqueue[index].toString(),
                      style: TextStyle(color: Colors.blue),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the home page
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
                ),
                child: Text("Back to Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void enqueue(int num) {
    stack1.add(num);
    displayqueue = List.from(stack1);
    stack2 = List.from(stack1.reversed);
  }

  void dequeue() {
    if (displayqueue.isEmpty) return;
    stack2.removeLast();
    stack1 = List.from(stack2.reversed);
    displayqueue = List.from(stack1);
  }
}
