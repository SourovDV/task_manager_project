import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_project/data/models/usermodel/userModel.dart';

class AuthController {
  static Future<void> saveUserData(token, UserModal model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("access-token", token);
    await sharedPreferences.setString("user-model", jsonEncode(model.toJson()));
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token =  sharedPreferences.getString("access-token");
    return token != null;
  }
}
