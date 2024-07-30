import 'package:flutter_mvvm_getx/utils/routes/routes_names.dart';
import 'package:flutter_mvvm_getx/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{

  static appRoutes() => [
    GetPage(name: RouteNames.splash, page: ()=> const SplashScreen()),

  ];
}