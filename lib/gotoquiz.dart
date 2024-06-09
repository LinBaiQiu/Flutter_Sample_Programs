import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/widgets/quiz9.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Go to Other"),
              onPressed: () => Get.to(Other()),
            ),
            const SizedBox(height: 20),
          ElevatedButton(
              child: Text("Go to Quiz List"),             
              onPressed: () => Get.to(HomePage()),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
  }
}

class Other extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Other Pages")),
      body: Center(child: Text("Count: ${c.count}")),
    );
  }
}

