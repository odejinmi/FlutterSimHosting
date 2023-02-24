import 'package:get/get.dart';

import 'splashscreen_controller.dart';
/// GetX Template Generator - fb.com/htngu.99
///

class SplashscreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashscreenController());
  }
}