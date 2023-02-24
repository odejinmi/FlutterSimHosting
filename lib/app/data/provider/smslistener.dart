
import 'dart:convert';

import 'package:fluttersimhosting/app/database/databasemodel.dart';
import 'package:fluttersimhosting/app/utils/strings.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import '../../database/database.dart';
import 'apicall.dart';

backgroundMessageHandler(SmsMessage message) async {
  //Handle background message
  uploadtoserver({
    'sender': message.address,
    'message': message.body,
    'time': message.date.toString(),
  });
}
class SmsListener {

}
final Telephony telephony = Telephony.instance;

void listing(){
  telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {

        // Handle message
        uploadtoserver({
          'sender': message.address,
          'message': message.body,
          'time': message.date.toString(),
        });

      },
      onBackgroundMessage: backgroundMessageHandler
  );
}


var apicontroller = Get.put(ApiProvider(), permanent: true);
void uploadtoserver(Map body)async{
  print("body");
  print(body);
  // isloading = true;
  var response = await apicontroller.posttokendetail(apicontroller.url+"hook/inbox",body);
  // isloading = false;
  apicontroller.loginprogress(response,success:(serverdata) async {
    var airtimemodel = Databasemodel(code: "FROM: ${body["sender"]}",timestamp: body["time"],
        processSeen: "not-seen",reference: "",response: "MESSAGE: ${body["message"]}", type: "INBOX");
      await insertContact(
      airtimemodel, databasename.TABLE_PROCESS);
  });
}