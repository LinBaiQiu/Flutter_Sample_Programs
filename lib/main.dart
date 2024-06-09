import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/ToDo.dart';
void main() => runApp(GetMaterialApp(home: ToDoHome()));

class ToDoHome extends StatelessWidget {
  @override
  Widget build(context) {    

    return Scaffold(     
      appBar: AppBar(title: Text("ToDo App")),      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 119, 188, 231), // Button background color
                ),
              child: Text("ToDo List"),
               onPressed: () => Get.to(ToDo())               
            ),
          ],),
      ),
    );
  }
}