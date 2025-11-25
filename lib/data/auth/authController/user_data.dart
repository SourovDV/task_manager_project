import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_project/data/model/userModel.dart';

class AuthController{
  static String? accessToken ;
  static UserModel ?accessModel;
  static String _accessToken ='access-token';
  static String _accessUser ='user';

  static Future<void> userData(String accessToken, UserModel model)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_accessToken, accessToken);
    sharedPreferences.setString(_accessUser, jsonEncode(model.toJson()));
  }

  static Future<void> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString(_accessToken);
    String ? usermodel = sharedPreferences.getString(_accessUser);
    accessToken = token;
    accessModel=UserModel.formJson(jsonDecode(usermodel!));
  }

  static Future<void> logOutData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  static Future<bool> isUserLoggedIn()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ? token= sharedPreferences.getString(_accessToken);
    if(token!=null){
      await getUserData();
      return true;
    }else{
      return false;
    }
  }
}