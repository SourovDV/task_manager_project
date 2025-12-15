import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/models/usermodel/showListOfTasksModel.dart';
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
  ShowListOfTask ?showListOfTask;

  Future<void> deleteTheItemFromList(String id) async {
    final response = await NetworkCaller.getDeleteRequest(
      url: Urls.deleteData(id),
    );

    if (response.isSuccess) {
      Get.snackbar("Success", "Task deleted");

      showListView();
      getTaskCoundByStatus();
    } else {
      Get.snackbar("Error", "Delete failed");
    }
  }

  Future<void> changeStatus(String id, String status) async {
    final response = await NetworkCaller.updateTaskStatus(
      url: Urls.updateTaskStatus(id, status),
    );

    if (response.isSuccess) {
      Get.snackbar("Success", "Status Updated");

      // list আবার আনো
      showListView();
      getTaskCoundByStatus();
    } else {
      Get.snackbar("Error", "Status update failed");
    }
  }

  Future<void> getTaskCoundByStatus()async{
    getListStatusTaskModelProgress.value = true;
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskCountByStatusModel);
    getListStatusTaskModelProgress.value = false;
    if(response.isSuccess){
      taskCountBystatusModel = TaskCountBystatusModel.fromJson(response.responseData!);
      showListView();
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

  Future<void> showListView()async{
    getListStatusTaskModelProgress.value = true;
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.showListView("New"));
    getListStatusTaskModelProgress.value = false;
    if(response.isSuccess){
      showListOfTask = ShowListOfTask.fromJson(response.responseData!);
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
    showListView();
  }
}