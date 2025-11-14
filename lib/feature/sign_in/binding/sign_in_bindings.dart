import 'package:get/get.dart';
import 'package:task_manager_project/feature/sign_in/controller/sign_in_controller.dart';

class SignInBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController());
  }

}