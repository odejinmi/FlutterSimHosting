import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/databasemodel.dart';
import '../../utils/strings.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class messagedetailsController extends GetxController with WidgetsBindingObserver {
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
final args = Get.arguments;
@override
void onInit() {
  // TODO: implement onInit
  super.onInit();
  WidgetsBinding.instance.addObserver(this);
  samuel = args;
}

@override
void onClose() {
  WidgetsBinding.instance.removeObserver(this);
}

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  final _samuel = Databasemodel().obs;
  set samuel(value) => _samuel.value = value;
  get samuel => _samuel.value;



}
