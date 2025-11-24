import 'package:get/get.dart';
import 'package:task_manager_project/feature/profile/controller/profile_controller.dart';

class ProfileBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }

}