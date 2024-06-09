import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_sample/widgets/quiz9.dart';
import 'package:getx_sample/widgets/quiz10.dart';
import 'package:getx_sample/widgets/quiz1.dart';
import 'package:getx_sample/widgets/quiz2.dart';
import 'package:getx_sample/widgets/quiz3.dart';
import 'package:getx_sample/widgets/quiz4.dart';
import 'package:getx_sample/widgets/quiz5.dart';
import 'package:getx_sample/widgets/quiz6.dart';
import 'package:getx_sample/widgets/quiz7.dart';
import 'package:getx_sample/widgets/quiz8.dart';

class ToDo extends StatelessWidget {
  @override
  Widget build(context) {    
    return Scaffold(      
      appBar: AppBar(title: Text("ToDo List")),    
       backgroundColor: Color.fromARGB(255, 165, 207, 231), 
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            ListTile(
              title: Text("1. Anagram Program"),tileColor: Color.fromARGB(255, 153, 178, 198), onTap: () => Get.to(AnagramsPage()),
            ),
            ListTile(
              title: Text("2. Leap Year Program"), tileColor: Color.fromARGB(255, 166, 226, 175), onTap: () => Get.to(YearPage()),
            ),
            ListTile(
              title: Text("3. Palindrome Program"),tileColor: Color.fromARGB(255, 153, 178, 198), onTap: () => Get.to(Palindrome()),
            ),
            ListTile(
              title: Text("4. Circle Intersection "), tileColor: Color.fromARGB(255, 166, 226, 175),onTap: () => Get.to(CirclePage()),
            ),
            ListTile(
              title: Text("5. Prime Number"),tileColor: Color.fromARGB(255, 153, 178, 198), onTap: () => Get.to(PrimePage()),
            ),
            ListTile(
              title: Text("6. Queue using Stacks"), tileColor: Color.fromARGB(255, 166, 226, 175),onTap: () => Get.to(QueuePage()),
            ),
            ListTile(
              title: Text("7. Knapsack Problem"),tileColor: Color.fromARGB(255, 153, 178, 198), onTap: () => Get.to(CoinChangeHomePage()),
            ),
            ListTile(
              title: Text("8. LCS Program"),tileColor: Color.fromARGB(255, 166, 226, 175) , onTap: () => Get.to(LCSHomePage()),
            ),
            ListTile(
              title: Text("9. Calculator"), tileColor: Color.fromARGB(255, 153, 178, 198), onTap: () => Get.to(HomePage()),
            ),
            ListTile(
              title: Text("10. Temperature_Converter"), tileColor: Color.fromARGB(255, 166, 226, 175),onTap: () => Get.to(TemperatureConverterPage()),
            ),
          ],),
      ),
    );
  }
}
