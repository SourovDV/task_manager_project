import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/models/usermodel/taskCoundBystatusModel.dart';
import 'package:task_manager_project/data/services/network_caller.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/feature/controller/auth_controller.dart';
import 'package:task_manager_project/routes/app_pages.dart';
class NewController extends GetxController{
  void newScreentoAddTaskScreen(){
    Get.toNamed(AppPages.addTask);
  }
  void goToProfilePage(){
    Get.toNamed(AppPages.profile);
  }

  void logOut(){
    AuthController.clearUserData();
    Get.toNamed(AppPages.signIn);
  }

  RxBool getListStatusTaskModelProgress = false.obs;
  TaskCountBystatusModel ?taskCountBystatusModel;

  Future<void> getTaskCoundByStatus()async{
    getListStatusTaskModelProgress.value = true;
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskCountByStatusModel);
    getListStatusTaskModelProgress.value = false;
    if(response.isSuccess){
      taskCountBystatusModel = TaskCountBystatusModel.fromJson(response.responseData!);
    }else{
      Get.snackbar(
        "Success",
        "Register Successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }

  }

  @override
  void onReady() {
    super.onReady();
    getTaskCoundByStatus();
  }
}