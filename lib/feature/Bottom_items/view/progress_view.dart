import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/appbar_widgth.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/progress_controller.dart';


class ProgressView extends GetView<ProgressController> {
  const ProgressView({super.key});

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
                visible: controller.getprogressLoading == false,
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
                                  backgroundColor: Colors.grey,
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
