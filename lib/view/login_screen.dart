import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/res/widgets/round_button.dart';
import 'package:flutter_mvvm_getx/utils/utils.dart';
import 'package:flutter_mvvm_getx/view_model/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
            children: [
              TextFormField(
                controller: loginController.emailController.value,
                focusNode: loginController.emailFocusNode.value,
                validator: ((value) {
                  if (value!.isEmpty) {
                    Utils.snackBar('enter_email'.tr, context);
                    return 'empty_email_error'.tr;
                  }
                  return null;
                }),
                onFieldSubmitted: (value) {
                  Utils.changeNodeFocus(context,
                      current: loginController.emailFocusNode.value,
                      next: loginController.passwordFocusNode.value);
                },
                decoration: InputDecoration(
                    hintText: 'enter_email'.tr,
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                controller: loginController.passwordController.value,
                focusNode: loginController.passwordFocusNode.value,
                validator: ((value) {
                  if (value!.isEmpty) {
                    Utils.snackBar('enter_password'.tr, context);
                    return 'empty_password_error'.tr;
                  }
                  return null;
                }),
                onFieldSubmitted: (value) {
                  Utils.changeNodeFocus(context,
                      current: loginController.passwordFocusNode.value);
                },
                decoration: InputDecoration(
                    hintText: 'enter_password'.tr,
                    border: const OutlineInputBorder()),
              ),
            ],
                        ),
                      ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() => RoundButton(
            title: 'login'.tr,
            loading: loginController.loading.value,
            onPress: () {
              if (_formKey.currentState!.validate()) {
                loginController.loginApi(context);
              }
            },
          ))
        ],
      ),
    );
  }
}
