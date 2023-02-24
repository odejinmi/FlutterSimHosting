import 'package:get/get.dart';

import 'package:flutter/services.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:telephony/telephony.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

import '../../component/custom_alert_dialog.dart';
import 'apicall.dart';
import 'globalvariable.dart';

class Ussdservice{

}

var apicontroller = Get.put(ApiProvider(), permanent: true);

void getUSSD()async{
  // isloading = true;
  var response = await apicontroller.gettokendetail(apicontroller.url+"getUSSD");
  // isloading = false;
  loginprogress(response,success:(serverdata) async {
    smsgetrequest();
    var simslot = serverdata["data_sim"];
    try {
      String? _res = await UssdAdvanced.sendAdvancedUssd(
          code: serverdata["data"], subscriptionId: 1);
      if (_res != null) {
        postUSSD({
          "response": _res
        }, serverdata["data_id"]);
      }
    }catch (e){
      print(e);
    }
  },fail: smsgetrequest );
}
void postUSSD(Map body,id)async{
  // isloading = true;
  var response = await apicontroller.postdetail(apicontroller.url+"postUSSD/$id",body);
  // isloading = false;
  loginprogress(response,success:(serverdata) async {
    smsgetrequest();
  });
}
final Telephony telephony = Telephony.instance;
final SmsSendStatusListener listener = (SendStatus status) {
  // Handle the status
  switch(status) {
    case SendStatus.SENT:
      print("Sent");
      break;
    case SendStatus.DELIVERED:
      print("Delivered");

  }

};
void smsgetrequest()async{
  // isloading = true;
  var response = await apicontroller.gettokendetail(apicontroller.url+"getSMS");
  // isloading = false;
  loginprogress(response,success:(serverdata) async {
    getUSSD();
    telephony.sendSms(
        to: serverdata["data_phone"],
        message: serverdata["data_message"],
        statusListener: listener
    );
  },fail: getUSSD);
}


// var prefs = GetStorage();
loginprogress(response,{String? endpoint, required Function success, Function? fail}){
  if (response.statusCode == 200) {
    var cmddetails = response.body;
    // serverdata = cmddetails['data'];
    var servermessage = cmddetails['message'] ?? "user";
    if (cmddetails['status'] == 1) {
      success(cmddetails);
    // } else if (servermessage == "Invalid token supplied"){
    //   prefs.remove('token');
    //   if (!Get.find<Globalvariable>().isInForeground) {
    //     CustomAlertDialogloader(
    //         title: "Error",
    //         message: cmddetails['message'],
    //         negativeBtnText: 'Continue');
    //     Get.offAllNamed("/loginscreen");
    //   }
    } else {
      if (!Get.find<Globalvariable>().isInForeground) {
      // if (!isInForeground) {
        // CustomAlertDialogloader(
        //     title: "Error",
        //     message: cmddetails['message'],
        //     negativeBtnText: 'Continue');
      }
    }
  } else {
    if (fail == null) {
      if (!Get.find<Globalvariable>().isInForeground) {
      // if (!isInForeground) {
        // CustomAlertDialogloader(
        //     title: "Error",
        //     message: "Connection Error",
        //     // onPostivePressed: () {},
        //     // positiveBtnText: 'Continue',
        //     negativeBtnText: 'Continue');
      }
    }else{
      fail();
    }
  }
}