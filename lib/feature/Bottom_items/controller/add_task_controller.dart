import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/services/network_caller.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/feature/controller/auth_controller.dart';

class AddTaskController extends GetxController {
  final addTaskKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool addTaskLoading = false.obs;

  String? titleValidation(value) {
    if (value == null || value.isEmpty) {
      return "Title must be required";
    }
    return null;
  }

  String? descriptionValidation(value) {
    if (value == null || value.isEmpty) {
      return "Description must be required";
    }
    return null;
  }

  void addedNewTask() {
    if (addTaskKey.currentState!.validate()) {
      _newUserTask();
    }else{
      print("form not validate");
    }
  }

  Future<void> _newUserTask() async {
    addTaskLoading.value = true;
    Map<String, dynamic> userBody = {
      "title": titleController.text.trim(),
      "description": descriptionController.text.trim(),
      "status": "New",
    };
    print("TOKEN BEFORE API => ${AuthController.userToken}");
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.addUserTask,
      body: userBody,
    );
    print(response);
    addTaskLoading.value = false;
    if (response.isSuccess) {
      clearForm();
      Get.snackbar(
        "Success",
        "Register Successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void clearForm() {
    titleController.clear();
    descriptionController.clear();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
