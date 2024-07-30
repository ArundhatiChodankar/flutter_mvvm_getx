import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/utils/routes/routes.dart';
import 'package:flutter_mvvm_getx/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

