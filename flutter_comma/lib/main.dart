import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
        ),
        GetPage(
          name: '/comma',
          page: () => Other(),
        ),
      ],
      // initialRoute: '/',
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            "Clicks: ${c.count}",
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Other"),
          onPressed: () => Get.to(
            Other(),
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment),
    );
  }
}

class Other extends StatelessWidget {
  //final Controller c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Text("{c.count}"),
      ),
    );
  }
}
