import 'package:get/get.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class SignInController extends GetxController{
  void signInToEmailVerification(){
    Get.toNamed(AppPages.forgotEmailVerification);
  }
}