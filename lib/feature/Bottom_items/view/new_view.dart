import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/common/utils/widget/appbar_widgth.dart';
import 'package:task_manager_project/feature/Bottom_items/controller/new_controller.dart';
import 'package:task_manager_project/feature/Bottom_items/widgth/card.dart';

class NewView extends GetView<NewController> {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidgth(),
      body: Column(
        children: [
          SizedBox(height: 8.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCard(number: '05', title: 'New'),
                buildCard(number: '04', title: 'Progress'),
                buildCard(number: '03', title: 'Complete'),
                buildCard(number: '02', title: 'Cancel'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              // এখানে তোমার ইচ্ছামতো রঙ দাও
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
