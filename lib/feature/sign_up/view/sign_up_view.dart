import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/background.dart';
import 'package:task_manager_project/common/utils/widget/common_next_button.dart';
import 'package:task_manager_project/feature/sign_up/controller/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up", style: theme.labelLarge),
              SizedBox(height: 20.h),
              TextFormField(decoration: InputDecoration(hintText: "Your Name")),
              SizedBox(height: 10.h),
              TextFormField(decoration: InputDecoration(hintText: "Your Email")),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: "Your Password"),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: "Your Address"),
              ),
              SizedBox(height: 10.h),
              TextFormField(decoration: InputDecoration(hintText: "Your number")),
              SizedBox(height: 20.h),
              CommonButton(child: () {}),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you have accound", style: theme.labelSmall),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: ()=>controller.signUpToSignIn(),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
