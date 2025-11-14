import 'package:get/get.dart';
import 'package:task_manager_project/feature/Bottom_items/view/cancel.dart';
import 'package:task_manager_project/feature/Bottom_items/view/complate_view.dart';
import 'package:task_manager_project/feature/Bottom_items/view/new_view.dart';
import 'package:task_manager_project/feature/Bottom_items/view/progress_view.dart';

class ItemController extends GetxController{
  RxInt selectIndex = 0.obs;
  static final List data = [
    NewView(),
    ProgressView(),
    ComplateView(),
    CancelView()
  ];

}