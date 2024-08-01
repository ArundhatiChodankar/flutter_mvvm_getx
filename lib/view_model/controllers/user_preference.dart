import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

class UserPreference extends GetxController{

  Future<bool> saveUser(UserModel user) async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString("token", user.token.toString());
  return true;
  }

  Future<UserModel?> getUser() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  final String? token = sp.getString("token");
  return UserModel(token: token.toString());
  }

  Future<bool> removeUser() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  sp.remove("token");
  return true;

  }

}