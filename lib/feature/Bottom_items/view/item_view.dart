import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectIndex.value,
          onDestinationSelected: (index) {
            controller.selectIndex.value = index;
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.new_label_outlined),
              label: "New",
            ),
            NavigationDestination(icon: Icon(Icons.refresh), label: "Progress"),
            NavigationDestination(icon: Icon(Icons.done), label: "Completed"),
            NavigationDestination(icon: Icon(Icons.cancel), label: "Canceled"),
          ],
        ),
      ),
    );
  }
}
