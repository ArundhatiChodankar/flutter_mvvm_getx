import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/res/assets/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image(image:AssetImage(AppImages.bakehouse)),
    );
  }
}
