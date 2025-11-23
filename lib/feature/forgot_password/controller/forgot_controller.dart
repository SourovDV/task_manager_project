import 'package:get/get.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class ForgotEmailController extends GetxController{
  void forgotToPinScreen(){
    Get.toNamed(AppPages.pinVerification);
  }

  void pinVerificationToSetPassword(){
    Get.toNamed(AppPages.setPassword);
  }

  void setPasswordToSignUpScreen(){
    Get.toNamed(AppPages.signUp);
  }

  void emailScreentoSignInScreen(){
    Get.toNamed(AppPages.signIn);
  }
}