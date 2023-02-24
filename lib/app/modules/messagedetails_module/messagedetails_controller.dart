import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/globalvariable.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class messagedetailsController extends GetxController with WidgetsBindingObserver {
@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  super.didChangeAppLifecycleState(state);
  Get.find<Globalvariable>().isInForeground = state == AppLifecycleState.resumed;
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
void onInit() {
  // TODO: implement onInit
  super.onInit();
  WidgetsBinding.instance.addObserver(this);
}

@override
void onClose() {
  WidgetsBinding.instance.removeObserver(this);
}

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
