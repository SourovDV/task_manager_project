import 'package:get/get.dart';
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

}