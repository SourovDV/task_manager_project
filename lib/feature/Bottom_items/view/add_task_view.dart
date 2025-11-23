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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            Text("Add New Task",style: theme.labelLarge,),
            SizedBox(height: 20.h,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Title"
              ),
            ),
            SizedBox(height: 15.h,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Description",
              ),
             maxLines: 5,
            ),
            SizedBox(height: 30.h,),
            CommonButton(child: (){})
          ],
        ),
      ),
    );
  }
}
