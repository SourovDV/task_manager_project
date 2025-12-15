import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/models/usermodel/userModel.dart';
import 'package:task_manager_project/data/services/network_caller.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/feature/controller/auth_controller.dart';

class ProfileController extends GetxController{
  RxBool profileProgress = false.obs;
  final updateKey =GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  String? emailValidation(value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!value.contains('@')) {
      return "Enter valid email";
    }
    return null;
  }
  String? firstNameValidation(value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  Future<void> updateProfile() async {
    profileProgress.value = true;
    final body = {
      "email": emailController.text.trim(),
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
    };

    final response = await NetworkCaller.postRequest(
      url: Urls.profileUpdate,
      body: body,
    );
  profileProgress.value = false;
    if (response.isSuccess) {
      // ✅ local userModal update manually
      AuthController.userModal?.email = emailController.text.trim();
      AuthController.userModal?.firstname = firstNameController.text.trim();
      AuthController.userModal?.lastname = lastNameController.text.trim();

      Get.snackbar("Success", "Profile Updated");
      Get.back(); // profile page বন্ধ
    } else {
      Get.snackbar("Error", "Profile update failed");
    }
  }



  @override
  void onInit() {
    super.onInit();
    // 🔹 আগের user data বসানো
    emailController.text = AuthController.userModal?.email ?? "";
    firstNameController.text = AuthController.userModal?.firstname ?? "";
    lastNameController.text = AuthController.userModal?.lastname ?? "";
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }
}