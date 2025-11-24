import 'package:get/get.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class ProgressController extends GetxController{
  void goToProfilePage(){
    Get.toNamed(AppPages.profile);
  }
}