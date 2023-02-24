import 'package:get/get.dart';

import 'messagedetails_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class messagedetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => messagedetailsController());
  }
}