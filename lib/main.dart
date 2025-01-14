import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx/ui_screen/dashboard_controller.dart';
import 'package:getx/ui_screen/splash_screen.dart';

import 'package:getx/ui_screen/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );

  }
}