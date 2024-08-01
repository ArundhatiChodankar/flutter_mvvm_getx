import 'package:flutter_mvvm_getx/utils/routes/routes_names.dart';
import 'package:flutter_mvvm_getx/view/home_screen.dart';
import 'package:flutter_mvvm_getx/view/login_screen.dart';
import 'package:flutter_mvvm_getx/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{

  static appRoutes() => [
    GetPage(name: RouteNames.splash, page: ()=> const SplashScreen()),
    GetPage(name: RouteNames.login, page: ()=> const LoginScreen()),
    GetPage(name: RouteNames.home, page: ()=> const HomeScreen()),

  ];
}