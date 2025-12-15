import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/app_color/app_color.dart';
import 'package:task_manager_project/feature/controller/auth_controller.dart';
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
      title:Obx((){
        return  Row(
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
                    Text("${AuthController.userModal.value?.firstname ?? "sourovss"} ${AuthController.userModal.value?.lastname??"ok"} ",style: TextStyle(fontSize: 22),),
                    Text("${AuthController.userModal.value?.email ?? "nai"}",style: TextStyle(fontSize: 17),)
                  ],
                ),
              ),
            ),
            icons
          ],
        );
      })
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
