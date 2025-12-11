import 'package:flutter/material.dart';
import 'package:task_manager_project/common/utils/app_color/app_color.dart';
class AppbarWidgth extends StatelessWidget implements PreferredSizeWidget{
  const AppbarWidgth({
    super.key, required this.even,
    required this.icons,
  });
 final VoidCallback even;
 final Widget icons;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
      AppColor.primaryColor,
      title: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 10,),
          Expanded(
            child: InkWell(
              onTap:even,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text("Sourov"),
                  Text("sourov@gmail.com")
                ],
              ),
            ),
          ),
          icons
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
