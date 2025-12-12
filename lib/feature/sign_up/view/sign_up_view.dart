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
      body: SingleChildScrollView(
        child: BackgroundImage(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100.h,),
                Text("Sign Up", style: theme.labelLarge),
                SizedBox(height: 20.h),
                Form(
                  key: controller.global_key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.nameController,
                        decoration: InputDecoration(hintText: "Your Name"),
                        validator: controller.nameValidation,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: 10),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.emailController,
                        decoration: InputDecoration(hintText: "Your Email"),
                        validator: controller.emailValidation,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.passwordController,
                        decoration: InputDecoration(hintText: "Your Password"),
                        validator: controller.passwordValidation,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.addressController,
                        decoration: InputDecoration(hintText: "Your Address"),
                        validator: controller.addressValidation,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.numberController,
                        decoration: InputDecoration(hintText: "Your Number"),
                        validator: controller.numberValidation,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                Obx(() {
                  return Visibility(
                    visible: controller.isLoading==false,
                    replacement: CircularProgressIndicator(),
                    child: CommonButton(
                      child: () {
                        controller.submitForm();

                      },
                    ),
                  );
                }),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you have accound", style: theme.labelSmall),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () => controller.signUpToSignIn(),
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
      ),
    );
  }
}
