import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_project/data/models/usermodel/userModel.dart';

class AuthController {
  static String? userToken;
  static UserModal? userModal;

  static String _accessToken = "access-token";
  static String _userData ="user-model";

  static Future<void> saveUserData(token, UserModal model) async {
    userToken = token;       // ✅ memory
    userModal = model;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessToken, token);
    await sharedPreferences.setString(_userData, jsonEncode(model.toJson()));
  }

  static Future<void> getUserData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String? token= sharedPreferences.getString(_accessToken);
    String? userdata= sharedPreferences.getString(_userData);
    userToken = token;
    userModal =UserModal.formJson( jsonDecode(userdata!));
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
