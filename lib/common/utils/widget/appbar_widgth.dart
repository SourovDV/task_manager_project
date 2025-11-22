import 'package:flutter/material.dart';
import 'package:task_manager_project/common/utils/app_color/app_color.dart';

class AppbarWidgth extends StatelessWidget implements PreferredSizeWidget{
  const AppbarWidgth({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      title: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 10,),
          Expanded(
            child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sourov Chandra",),
                  Text("sourovchandra65@gmail.com",)
                ],
              ),
            ),
          ),
          Icon(Icons.logout)
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
