import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/common_next_button.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Text("Add New Tasks", style: theme.labelLarge),
              SizedBox(height: 20.h),
              Form(
                key: controller.addTaskKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Title"),
                      controller: controller.titleController,
                      validator: controller.titleValidation,
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Description"),
                      maxLines: 5,
                      controller: controller.descriptionController,
                      validator: controller.descriptionValidation,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Obx(() {
                return Visibility(
                  visible: controller.addTaskLoading.value == false,
                  replacement: CircularProgressIndicator(),
                  child: CommonButton(
                    child: () {
                      controller.addedNewTask();
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
