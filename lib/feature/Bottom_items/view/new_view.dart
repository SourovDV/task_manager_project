import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/new_controller.dart';

class NewView extends GetView<NewController> {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("new"),
    );
  }
}
