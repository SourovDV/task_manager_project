import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/background.dart';
import 'package:task_manager_project/common/utils/widget/common_next_button.dart';
import 'package:task_manager_project/feature/forgot_password/controller/forgot_controller.dart';

class ForgotEmailVerification extends GetView<ForgotEmailController> {
  const ForgotEmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Email Address", style: theme.labelLarge),
              SizedBox(height: 5.h,),
              Text(
                "6 digit Verificaiton code we will seen your email",
                style: theme.labelSmall,
              ),
              SizedBox(height: 20.h,),
              TextFormField(decoration: InputDecoration(hintText: "Email")),
              SizedBox(height: 20.h,),
              CommonButton(),
            ],
          ),
        ),
      ),
    );
  }
}
