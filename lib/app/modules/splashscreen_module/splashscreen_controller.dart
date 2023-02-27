import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/provider/smslistener.dart';
import '../../utils/strings.dart';
/// GetX Template Generator - fb.com/htngu.99
///

class SplashscreenController extends GetxController with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    isInForeground = state == AppLifecycleState.resumed;
    // isInForeground = state == AppLifecycleState.resumed;
    update();
    // switch(state){
    //
    //   case AppLifecycleState.resumed:
    //     Get.find<Globalvariable>().isInForeground = true;
    //     break;
    //   case AppLifecycleState.inactive:
    //     Get.find<Globalvariable>().isInForeground = false;
    //     break;
    //   case AppLifecycleState.paused:
    //     Get.find<Globalvariable>().isInForeground = false;
    //     break;
    //   case AppLifecycleState.detached:
    //     Get.find<Globalvariable>().isInForeground = false;
    //     // TODO: Handle this case.
    //     break;
    // }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;


  // var prefs = GetStorage();

  gettoken() async {
    Future.delayed(const Duration(seconds: 10), () async {

      String sola = await token();
      if (sola != "you") {
        Get.offAllNamed("/mainpage");
      }  else{
        Get.offAllNamed("/loginscreen");
      }
      listing();
    });
  }
  @override
  void onInit() {
    gettoken();
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }
}
