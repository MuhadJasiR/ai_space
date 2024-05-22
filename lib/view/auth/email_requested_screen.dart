import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailRequestedScreen extends StatelessWidget {
  const EmailRequestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Our team will add you soon to our Community",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/landingScreen");
                },
                child: Text("Go home"))
          ],
        ),
      ),
    );
  }
}
