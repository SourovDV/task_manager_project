import 'package:get/get.dart';
import 'package:task_manager_project/feature/forgot_password/controller/forgot_controller.dart';

class ForgotBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ForgotEmailController());
  }

}