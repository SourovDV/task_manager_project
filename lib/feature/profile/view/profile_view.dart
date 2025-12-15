import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/appbar_widgth.dart';
import 'package:task_manager_project/common/utils/widget/common_next_button.dart';
import 'package:task_manager_project/feature/profile/controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppbarWidgth(even: () {}, icons: Icon(Icons.logout)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx((){
            return Visibility(
              visible: controller.profileProgress == false,
              replacement: CircularProgressIndicator(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80.h),
                  Text("Update Profile", style: theme.labelLarge),
                  SizedBox(height: 10.h),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 80.w,
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              "photo",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text("No item selected"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Form(
                    key: controller.updateKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: "Email"),
                          controller: controller.emailController,
                          validator: controller.emailValidation,
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          decoration: InputDecoration(hintText: "First Name"),
                          controller: controller.firstNameController,
                          validator: controller.firstNameValidation,
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Last Name"),
                          controller: controller.lastNameController,
                          validator: controller.firstNameValidation,
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Mobile"),
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Password"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CommonButton(child: () {
                    controller.updateProfile();
                  }),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
