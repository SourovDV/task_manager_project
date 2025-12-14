import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/app_color/app_color.dart';
import 'package:task_manager_project/common/utils/widget/appbar_widgth.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/new_controller.dart';
import 'package:task_manager_project/feature/Bottom_items/widgth/card.dart';

class NewView extends GetView<NewController> {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidgth(
        even: controller.goToProfilePage,
        icons: IconButton(onPressed: (){
          controller.logOut();
        }, icon: Icon(Icons.logout),)
      ),
      body: Column(
        children: [
          SizedBox(height: 8.h),
          // Horizontal Scroll Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx((){
              return Visibility(
                visible: controller.getListStatusTaskModelProgress ==false,
                replacement: CircularProgressIndicator(),
                child:SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.taskCountBystatusModel?.data?.length ?? 0,
                      itemBuilder: (context,index){
                    return buildCard(number:controller.taskCountBystatusModel!.data![index].sId ??"", title:controller.taskCountBystatusModel!.data![index].sum.toString());
                  }),
                ));
            })
          ),

          Expanded(child: buildListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.newScreentoAddTaskScreen();
        },
        backgroundColor: AppColor.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title will be here"),
                  Text("Description will be here"),
                  Text("13/04/2025"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "New",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(width: 10.w),
                          Icon(Icons.delete),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
