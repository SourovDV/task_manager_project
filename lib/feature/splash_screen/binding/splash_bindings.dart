import 'package:get/get.dart';
import 'package:task_manager_project/feature/splash_screen/controller/splash_controller.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
     Get.put(SplashController());
  }

}