import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/models/usermodel/userModel.dart';
import 'package:task_manager_project/data/services/network_caller.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/feature/controller/auth_controller.dart';

import 'package:task_manager_project/routes/app_pages.dart';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;

  final signInGlobalKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  String? emailValidation(value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!value.contains('@')) {
      return "Enter valid email";
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value == null || value.isEmpty) {
      return "Password required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 letters";
    }
    return null;
  }

  void signInSubmitForm() {
    if (signInGlobalKey.currentState!.validate()) {
        loginUser();

    } else {
      Get.snackbar(
        "Error",
        "Register Successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> loginUser()async{
    isLoading.value = true;
    Map<String,dynamic> userData={
      "email": emailController.text.trim(),
      "password":passwordController.text.trim()
    };
    NetworkResponse response =await NetworkCaller.postRequest(url: Urls.loginUser,body: userData);
    isLoading.value = false;
    if(response.isSuccess){
      Get.snackbar(
        "Success",
        "Register Successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearForm();
      String token = response.responseData!["token"];
      UserModal userModal = UserModal.formJson(response.responseData!["data"]);
      AuthController.saveUserData(token,userModal);

      signInButtonToItems();
    }else{
      Get.snackbar(
        "Error",
        "Register Successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }



  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }

  void signInToEmailVerification() {
    Get.toNamed(AppPages.forgotEmailVerification);
  }

  void signInButtonToItems() {
    Get.toNamed(AppPages.itemNavber);
  }

  void signInButtonToSignUp() {
    Get.toNamed(AppPages.signUp);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
