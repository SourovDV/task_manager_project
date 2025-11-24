import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/service/network_caller.dart';
import 'package:task_manager_project/data/utils/base_url.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class SignInController extends GetxController{
  RxBool isLoading = false.obs;

  final global_key=GlobalKey<FormState>();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

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
    if (global_key.currentState!.validate()) {
      print("All OK! Form Valid");
      userLogin();
    } else {
      print("Form Not Valid");
    }
  }

  Future<void> userLogin()async{
    isLoading.value=true;
    final NetworkRespons respons =await NetworkCaller.postRequest(url: Urls.userLogin, body: {
      "email":emailController.text.trim(),
      "password":passwordController.text
    });
    print("Status: ${respons.isSucessed}");
    print("Response: ${respons.responsdata}");
    isLoading.value=false;
    if(respons.isSucessed){
      print("sucess");
      Get.snackbar(
        "Success",
        "Task created successfully!",
      );
      signInButtonToNavberItems();

    }else{
      print("wrong");
      Get.snackbar(
        "Wrong",
        "Wrong",
      );
    }
  }


  void signInToEmailVerification(){
    Get.toNamed(AppPages.forgotEmailVerification);
  }

  void signInButtonToNavberItems(){
    Get.toNamed(AppPages.itemNavber);
  }

  void signInButtonToSignUp(){
    Get.toNamed(AppPages.signUp);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}