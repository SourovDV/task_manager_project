import 'package:get/get.dart';
import 'package:task_manager_project/feature/sign_up/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(SignUpController());
  }

}