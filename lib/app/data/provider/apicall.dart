import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersimhosting/app/data/provider/globalvariable.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

import '../../component/custom_alert_dialog.dart';


class ApiProvider extends GetConnect with WidgetsBindingObserver implements GetxService{
@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  super.didChangeAppLifecycleState(state);
  controller.isInForeground = state == AppLifecycleState.resumed;
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
  // var _token = "".obs;
  // set token(value) => _token.value = value;
  // get token => _token.value;

var controller = Get.put(Globalvariable(),permanent: true);
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

// final String appBaseUrl;
  // ApiProvider({required this.appBaseUrl});

  var url = "https://hostmobilesim.com/api/".obs;
  
  // var prefs = GetStorage();

  String baseurl(endpoint) =>url.value+endpoint;
  Future<Response<dynamic>> getdetail(url) async {
    print(url);
    final response = await get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=5000",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.connectionHeader: "keep-alive"
    });
    print(response.body);
    return response;

  }
  Future<Response<dynamic>> gettokendetail(url) async {
    print(url);
    // print(controller.token);
    print(Get.find<Globalvariable>().token);
    final response = await get(url, headers: {
      "serverid": controller.token,
      "Access-Control-Allow-Origin": "*",
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=5000",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      // HttpHeaders.authorizationHeader:
      // "Bearer ${Get.find<SavedetailsController>().token.value}",
      HttpHeaders.connectionHeader: "keep-alive"
    });
    print(response.body);
    return response;

  }

  Future<Response<dynamic>> postdetail(url, Map body) async {
    print(url);
    print(body);
    final response = await post(
      url,
      body,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000",
        HttpHeaders.connectionHeader: "keep-alive"
      },
    );
    print(response.body);
    return response;
  }

  Future<Response<dynamic>> posttokendetail(url, Map body) async {
    print(url);
    print(body);
    print(controller.token);
    // print(token);
    final response = await post(
      url,
      body,
      headers: {
        "serverid": controller.token,
        "Access-Control-Allow-Origin": "*",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000",
        HttpHeaders.connectionHeader: "keep-alive"
      },
    );
    print(response.body);
    print({
      "serverid": controller.token,
      "Access-Control-Allow-Origin": "*",
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000",
      // HttpHeaders.authorizationHeader:
      // "Bearer ${Get.find<SavedetailsController>().token.value}",
      HttpHeaders.connectionHeader: "keep-alive"
    });
    return response;
  }


  loginprogress(response,{String? endpoint, required Function success, Function? fail}){
    if (response.statusCode == 200) {
      var cmddetails = response.body;
      // serverdata = cmddetails['data'];
      var servermessage = cmddetails['message'] ?? "user";
      if (cmddetails['status'] == 1) {
        success(cmddetails);
      // } else if (servermessage == "Invalid token supplied"){
      //   prefs.remove('token');
      //   if (Get.find<Globalvariable>().isInForeground) {
      //     CustomAlertDialogloader(
      //         title: "Error",
      //         message: cmddetails['message'],
      //         negativeBtnText: 'Continue');
      //   }
      //   Get.offAllNamed("/loginscreen");
      } else {
        if (controller.isInForeground) {
        // if (isInForeground) {
          CustomAlertDialogloader(
              title: "Error",
              message: cmddetails['message'],
              negativeBtnText: 'Continue');
        }
      }
    } else {
      if (fail == null) {
        if (controller.isInForeground) {
        // if (isInForeground) {
          CustomAlertDialogloader(
              title: "Error",
              message: "Connection Error",
              // onPostivePressed: () {},
              // positiveBtnText: 'Continue',
              negativeBtnText: 'Continue');
        }
      }else{
        fail();
      }
    }
  }

}
