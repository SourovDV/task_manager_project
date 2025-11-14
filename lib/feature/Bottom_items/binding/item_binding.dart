import 'package:get/get.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/item_controller.dart';

class ItemBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ItemController());
  }

}