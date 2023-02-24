import 'package:get/get.dart';

import 'loginscreen_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class loginscreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => loginscreenController());
  }
}