import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/path_name/image_path.dart';
import 'package:task_manager_project/common/utils/widget/background.dart';
import 'package:task_manager_project/feature/splash_screen/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BackgroundImage(child: Image.asset(ImagePath.logoImage))
    );
  }
}


