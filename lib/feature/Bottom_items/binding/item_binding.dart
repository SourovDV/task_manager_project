import 'package:get/get.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/add_task_controller.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/item_controller.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/new_controller.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/progress_controller.dart';

class ItemBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ItemController());
    Get.put(NewController());
    Get.put(AddTaskController());
    Get.put(ProgressController());
  }

}