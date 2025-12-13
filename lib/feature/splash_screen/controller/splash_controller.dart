import 'package:get/get.dart';
import 'package:task_manager_project/feature/controller/auth_controller.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class SplashController extends GetxController{
  Future<void> splashScreenToSignInScreen()async{
    await Future.delayed(Duration(seconds: 2));
    bool isUserLoggedIn =await AuthController.isLoggedIn();
    if(isUserLoggedIn){
      Get.offAllNamed(AppPages.itemNavber);
    }else{
      Get.offAllNamed(AppPages.signIn);
    }

  }

  @override
  void onReady() {
    splashScreenToSignInScreen();
    super.onReady();
  }
}