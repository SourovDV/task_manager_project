import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/models/usermodel/showListOfTasksModel.dart';
import 'package:task_manager_project/data/services/network_caller.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class ComplateController extends GetxController{
  void goToProfilePage(){
    Get.toNamed(AppPages.profile);
  }
  void logOut(){
    Get.toNamed(AppPages.signIn);
  }

  RxBool getprogressLoadings = false.obs;
  ShowListOfTask ?showListOfTask;

  Future<void> getprogressDataFromLists()async{
    getprogressLoadings.value = true;
    final NetworkResponse response =await NetworkCaller.getRequest(url:Urls.showListView("completed"));
    getprogressLoadings.value = false;
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
    getprogressDataFromLists();
  }

}