import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/services/network_caller.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/feature/controller/auth_controller.dart';

class ProfileController extends GetxController {
  RxBool profileProgress = false.obs;
  final updateKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  String? emailValidation(value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!value.contains('@')) return "Enter valid email";
    return null;
  }

  String? firstNameValidation(value) {
    if (value == null || value.isEmpty) return "Name is required";
    return null;
  }

  void profileDataUpdate() {
    if (updateKey.currentState!.validate()) {
      updateProfile();

    }
  }

  Future<void> updateProfile() async {
    profileProgress.value = true;
    final response = await NetworkCaller.postRequest(
      url: Urls.profileUpdate,
      body: {
        "email": emailController.text.trim(),
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
      },
    );
      profileProgress.value = false;
    if (response.isSuccess) {
      AuthController.userModal.value =
          AuthController.userModal.value?.copyWith(
            email: emailController.text.trim(),
            firstname: firstNameController.text.trim(),
            lastname: lastNameController.text.trim(),
          );

      // 🔥 SharedPreferences update
      await AuthController.saveUserData(
        AuthController.userToken!,
        AuthController.userModal.value!,
      );
      Get.back();
      Get.snackbar("Success", "Profile Updated");
    } else {
      Get.snackbar("Error", "Profile update failed");
    }
  }

  @override
  void onInit() {
    super.onInit();
    final user = AuthController.userModal.value;
    emailController.text = user?.email ?? "";
    firstNameController.text = user?.firstname ?? "";
    lastNameController.text = user?.lastname ?? "";
  }

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}
