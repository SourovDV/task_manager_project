import 'package:get/get.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class SignUpController extends GetxController{
    void signUpToSignIn(){
      Get.toNamed(AppPages.signIn);
    }
}