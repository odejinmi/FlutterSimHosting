import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get_storage/get_storage.dart';

import '../../component/custom_alert_dialog_widget.dart';
import '../../data/provider/apicall.dart';
import '../../data/provider/globalvariable.dart';
import '../../data/provider/ussdservice.dart';
import '../../database/database.dart';
import '../../database/databasemodel.dart';
import '../../theme/app_colors.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MainpageController extends GetxController with WidgetsBindingObserver {
  var controller = Get.put(Globalvariable(), permanent: true);
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    controller.isInForeground = state == AppLifecycleState.resumed;
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

  final _processes = [].obs;
  set processes(value) => _processes.value = value;
  get processes => _obj.value;

  final _isloading = false.obs;
  set isloading(value) => _isloading.value = value;
  get isloading => _isloading.value;

  var apicontroller = Get.put(ApiProvider(), permanent: true);
  // var prefs = GetStorage();

  void logout()async{
    isloading = true;
    CustomAlertDialogWidgetloader(widget: Container(
      height: 50,
      child: const SpinKitCircle(
        color: primaryColor,
        size: 50.0,
      ),
    ));
    var response = await apicontroller.gettokendetail(apicontroller.url+"logout");
    isloading = false;
    Get.back();
    apicontroller.loginprogress(response,success:(serverdata) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove('token');
      Get.offAllNamed("/loginscreen");
    });
  }

  void FetchDetails() async {
    processes = databasemodelFromJson(jsonEncode(await fetchallContact("process")));
    print(processes);
  }
  void updateseen(Databasemodel dog) async {
    Databasemodel sola = dog;
    sola.processSeen = "seen";
    updateseen(sola);


  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    FetchDetails();
    // Future.doWhile(() async {
    //   // value++;
    //   await Future.delayed(const Duration(seconds: 10));
    //   token = prefs.read('token')??"you";
    //   // if (value == 3) {
    //   //   print('Finished with $value');
    //   //   return false;
    //   // }
    //   getUSSD();
    //   return true;
    // });
    getUSSD();
  }
}
