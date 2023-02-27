import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/provider/apicall.dart';
import '../../utils/strings.dart';
/// GetX Template Generator - fb.com/htngu.99
///

class loginscreenController extends GetxController with WidgetsBindingObserver {
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
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    permissionrequest();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> permissionrequest() async {
    await Permission.phone.request();
     Permission.location.request();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;


  final _formKey = GlobalKey<FormState>().obs;
  set formKey(value) => _formKey.value = value;
  get formKey => _formKey.value;

  final _isloading = false.obs;
  set isloading(value) => _isloading.value = value;
  get isloading => _isloading.value;

  final _passwordController = TextEditingController().obs;
  set passwordController(value) => _passwordController.value = value;
  get passwordController => _passwordController.value;

  var apicontroller = Get.put(ApiProvider(), permanent: true);
  var prefs = GetStorage();
  void login(Map body)async{
    isloading = true;
    var response = await apicontroller.postdetail(apicontroller.url+"authenticate",body);
    isloading = false;
    apicontroller.loginprogress(response,success:(serverdata) async {
      prefs.write('token', serverdata['token']);
      final pref = await SharedPreferences.getInstance();
      pref.setString('token', serverdata['token']).then((value) {
        Get.offAllNamed("/mainpage");
      });
    });
  }
}
