import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_project/common/utils/widget/background.dart';
import 'package:task_manager_project/common/utils/widget/common_next_button.dart';
import 'package:task_manager_project/feature/forgot_password/controller/forgot_controller.dart';

class PinVerification extends GetView<ForgotEmailController> {
  const PinVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pin Verification", style: theme.labelLarge),
              SizedBox(height: 10.h,),
              Text(
                "We have been seen 6 digit pin in your email",
                style: theme.labelSmall,
              ),
              SizedBox(height: 10.h,),
              buildPinCodeTextField(context),
              CommonButton(child: (){
                controller.pinVerificationToSetPassword();
              }),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you have accound",style: theme.labelSmall,),
                  SizedBox(width: 10.w,),
                  Text("Sign In",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  PinCodeTextField buildPinCodeTextField(BuildContext context) {
    return PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              appContext: context,
            );
  }
}
