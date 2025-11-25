import 'package:get/get.dart';
import 'package:task_manager_project/data/auth/authController/user_data.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class SplashController extends GetxController{
  Future<void> splastScreenToSignInScreen()async{
    await Future.delayed(Duration(seconds: 2));
    bool isUserLogin=await AuthController.isUserLoggedIn();
    if(isUserLogin){
      Get.toNamed(AppPages.itemNavber);
    }else {
      Get.toNamed(AppPages.signIn);
    }
  }

  @override
  void onReady() {
    splastScreenToSignInScreen();
    super.onReady();
  }
}