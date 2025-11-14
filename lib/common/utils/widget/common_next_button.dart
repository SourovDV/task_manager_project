import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_project/common/utils/app_color/app_color.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key, required this.child,
  });
  final VoidCallback child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: child,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
