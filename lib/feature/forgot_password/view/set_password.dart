import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/background.dart';
import 'package:task_manager_project/common/utils/widget/common_next_button.dart';
import 'package:task_manager_project/feature/forgot_password/controller/forgot_controller.dart';

class SetPassword extends GetView<ForgotEmailController> {
  const SetPassword({super.key});

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
              Text("Set Password", style: theme.labelLarge),
              SizedBox(height: 10.h,),
              Text(
                "If you want to change plase give current and confirm password",
                style: theme.labelSmall,
              ),
              SizedBox(height: 10.h,),
              TextFormField(
                decoration: InputDecoration(hintText: "Current password"),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: "Confirm password"),
              ),
              SizedBox(height: 20.h),
              CommonButton(child: () {
                controller.setPasswordToSignUpScreen();
              }),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you have accound", style: theme.labelSmall),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: ()=>controller.emailScreentoSignInScreen(),
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
