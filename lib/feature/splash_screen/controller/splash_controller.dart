import 'package:get/get.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class SplashController extends GetxController{
  Future<void> splastScreenToSignInScreen()async{
    await Future.delayed(Duration(seconds: 2));
      Get.toNamed(AppPages.signIn);
  }

  @override
  void onReady() {
    splastScreenToSignInScreen();
    super.onReady();
  }
}