import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/custom_alert_dialog.dart';
import '../../utils/strings.dart';


class ApiProvider extends GetConnect with WidgetsBindingObserver implements GetxService{
@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  super.didChangeAppLifecycleState(state);
  isInForeground = state == AppLifecycleState.resumed;
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

// final String appBaseUrl;
  // ApiProvider({required this.appBaseUrl});

  var url = "https://hostmobilesim.com/api/".obs;

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
    final response = await get(url, headers: {
      "serverid": token,
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
    final response = await post(
      url,
      body,
      headers: {
        "serverid": token,
        "Access-Control-Allow-Origin": "*",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000",
        HttpHeaders.connectionHeader: "keep-alive"
      },
    );
    print(response.body);
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
        if (isInForeground) {
          CustomAlertDialogloader(
              title: "Error",
              message: cmddetails['message'],
              negativeBtnText: 'Continue');
        }
      }
    } else {
      if (fail == null) {
        if (isInForeground) {
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
