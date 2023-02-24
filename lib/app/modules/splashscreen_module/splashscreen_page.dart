import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splashscreen_controller.dart';
/// GetX Template Generator - fb.com/htngu.99
///

class SplashscreenPage extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    var hello = Get.put(SplashscreenController());
    return Scaffold(
      body: Center(
        child: Image.asset("asset/logo.png"),
      ),
    );
  }
}
