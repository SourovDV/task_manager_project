import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/appbar_widgth.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/complate_controller.dart';

class ComplateView extends GetView<ComplateController> {
  const ComplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidgth(even: controller.goToProfilePage, icons: IconButton(onPressed: (){
        controller.logOut();
      }, icon: Icon(Icons.logout),)),
      body: Column(
        children: [
          Expanded(
              child: Obx((){
                return Visibility(
                  visible: controller.getprogressLoadings == false,
                  replacement: CircularProgressIndicator(),
                  child: ListView.builder(
                    itemCount: controller.showListOfTask?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.showListOfTask!.data![index].title ?? ""),
                                Text(controller.showListOfTask!.data![index].description ?? ""),
                                Text(controller.showListOfTask!.data![index].createdDate ?? ""),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    "Complete",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
          ),
        ],
      ),
    );
  }
}
