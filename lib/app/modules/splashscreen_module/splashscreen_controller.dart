import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/provider/globalvariable.dart';
import '../../data/provider/smslistener.dart';
/// GetX Template Generator - fb.com/htngu.99
///

class SplashscreenController extends GetxController with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Get.find<Globalvariable>().isInForeground = state == AppLifecycleState.resumed;
    isInForeground = state == AppLifecycleState.resumed;
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

    var _token = "".obs;
  set token(value) => _token.value = value;
  get token => _token.value;

  var prefs = GetStorage();

  // var controller = Get.put(Globalvariable(),permanent: true);
  @override
  void onInit() {
    token = prefs.read('token')??"";
    print("splashcreen token");
    print(token);
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(milliseconds: 1000), () async {
      listing();
      // if (controller.token.isNotEmpty) {
      if (token.isNotEmpty) {
        Get.offAllNamed("/mainpage");
      }  else{
        Get.offAllNamed("/loginscreen");
      }
    });
  }
}
