import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/complate_controller.dart';

class ComplateView extends GetView<CompleteController> {
  const ComplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("complate"),
    );
  }
}
