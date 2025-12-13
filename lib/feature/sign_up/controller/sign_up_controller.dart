import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/services/network_caller.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;

  void signUpToSignIn() {
    Get.toNamed(AppPages.signIn);
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();

  final signUpGlobalKey = GlobalKey<FormState>();

  // Common validation
  String? nameValidation(value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

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

  String? addressValidation(value) {
    if (value == null || value.isEmpty) {
      return "Address required";
    }
    return null;
  }

  String? numberValidation(value) {
    if (value == null || value.isEmpty) {
      return "Number required";
    }
    if (value.length < 11) {
      return "Enter valid number";
    }
    return null;
  }

  void submitForm() {
    if (signUpGlobalKey.currentState!.validate()) {
      registerUser();
    } else {
      print("Form Not Valid");
    }
  }

  void gotoNavBarItem() {
    Get.toNamed(AppPages.itemNavber);
  }

  //post request call
  Future<void> registerUser() async {
    isLoading.value = true;
    Map<String, dynamic> userData = {
      "email": emailController.text.trim(),
      "firstName": nameController.text.trim(),
      "lastName": nameController.text.trim(),
      "mobile": numberController.text.trim(),
      "password": passwordController.text.trim(),
      "photo": "",
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.registerUser,
      body: userData,
    );
    isLoading.value = false;
    if (response.isSuccess) {
      clearForm();
      Get.snackbar(
        "Success",
        "Register Successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );
      gotoNavBarItem();
    }
  }


  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    addressController.clear();
    numberController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
