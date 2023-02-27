
import 'dart:convert';

import 'package:fluttersimhosting/app/database/databasemodel.dart';
import 'package:fluttersimhosting/app/utils/strings.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import '../../database/database.dart';
import 'apicall.dart';

backgroundMessageHandler(SmsMessage message) async {
  savedata(message);
  //Handle background message
}
class SmsListener {

}
final Telephony telephony = Telephony.instance;

void listing(){
  telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        savedata(message);
        // Handle message


      },
      onBackgroundMessage: backgroundMessageHandler
  );
}


Future<void> savedata(SmsMessage message) async {
  var airtimemodel = Databasemodel(code: message.address, timestamp: message.date.toString(),
      processSeen: "not-seen",reference: "",response: message.body, type: "INBOX", uploaded: "0");
 await insertContact(airtimemodel, databasename.TABLE_PROCESS);
}
var apicontroller = Get.put(ApiProvider(), permanent: true);
