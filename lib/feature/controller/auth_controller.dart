import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_project/data/models/usermodel/userModel.dart';

class AuthController {
  static String? userToken;
  static Rx<UserModal?> userModal = Rx<UserModal?>(null);

  static String _accessToken = "access-token";
  static String _userData ="user-model";

  static Future<void> saveUserData(token, UserModal model) async {
    userToken = token;       // ✅ memory
    userModal.value = model;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessToken, token);
    await sharedPreferences.setString(_userData, jsonEncode(model.toJson()));
  }

  static Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    userToken = prefs.getString(_accessToken);
    final userdata = prefs.getString(_userData);

    if (userdata != null) {
      userModal.value = UserModal.formJson(jsonDecode(userdata));
    }
  }


  static Future<void> clearUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
  static Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token =  sharedPreferences.getString(_accessToken);
    if(token!=null){
      await getUserData();
      return true;
    }
    return false;

  }
}
