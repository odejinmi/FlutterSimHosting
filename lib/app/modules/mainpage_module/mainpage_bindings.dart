import 'package:get/get.dart';

import 'mainpage_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MainpageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainpageController());
  }
}