import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/utils/routes/routes_names.dart';
import 'package:flutter_mvvm_getx/view_model/controllers/user_preference.dart';
import 'package:get/get.dart';

class SplashService{
  void isLogin(){
    UserPreference userPreference = UserPreference();

    userPreference.getUser().then((value) {
      print('SplashService.isLogin='+value!.token.toString());

      if (value!.token.toString() == "null" || value.token.toString() == "") {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteNames.login);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteNames.home);
        });
      }
    });

  }
}