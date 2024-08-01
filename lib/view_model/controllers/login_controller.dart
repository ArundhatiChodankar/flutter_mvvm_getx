import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_getx/model/user_model.dart';
import 'package:flutter_mvvm_getx/repository/login_repository.dart';
import 'package:flutter_mvvm_getx/utils/routes/routes_names.dart';
import 'package:flutter_mvvm_getx/view_model/controllers/user_preference.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepository();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<FocusNode> emailFocusNode = FocusNode().obs;
  Rx<FocusNode> passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  UserPreference userPreference = UserPreference();

  void loginApi(BuildContext context) {
    loading.value = true;
    var data = {
      'email': emailController.value.text.toString(),
      'password': passwordController.value.text.toString()
    };
    loginRepository.loginApi(data).then((value) {
      loading.value = false;
      Utils.flushBarErrorMessage('Login Successful', context);
      userPreference
          .saveUser(UserModel.fromJson(value))
          .then((value) => Get.toNamed(RouteNames.home));
    }).onError((error, stackTrace) {
      //print('LoginController.loginApi '+error.toString());
      loading.value = false;
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
