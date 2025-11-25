import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/background.dart';
import 'package:task_manager_project/common/utils/widget/common_next_button.dart';
import 'package:task_manager_project/feature/sign_in/controller/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Get Started With", style: theme.labelLarge),
              SizedBox(height: 20.h),

              Form(
                key: controller.global_key,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "Email"),
                      controller: controller.emailController,
                      validator: controller.emailValidation,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Password"),
                      controller: controller.passwordController,
                      validator: controller.passwordValidation,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
             Obx((){
               return  Visibility(
                 visible: controller.isLoading == false,
                 replacement: CircularProgressIndicator(),
                 child: CommonButton(
                   child: () {
                     controller.signInSubmitForm();
                   },
                 ),
               );
             }),
              SizedBox(height: 50),
              InkWell(
                onTap: () => controller.signInToEmailVerification(),
                child: Text("Forgot Password", style: theme.labelSmall),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you don't have accound ", style: theme.labelSmall),
                  InkWell(
                    onTap: () => controller.signInButtonToSignUp(),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
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
