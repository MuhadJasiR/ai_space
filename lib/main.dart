import 'package:ai_space/core/dependency/init_dependency.dart';
import 'package:ai_space/routes/routes.dart';
import 'package:ai_space/view/home/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDependency(),
      theme: ThemeData(),
      initialRoute: RouteClass.landingScreen,
      getPages: RouteClass.routes,
    );
  }
}
