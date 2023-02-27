import 'dart:convert';

import 'package:get/get.dart';

import '../../database/database.dart';
import '../../database/databasemodel.dart';
import '../../utils/strings.dart';
import 'apicall.dart';




  Future<void> uploadsms() async {
   var senderslist = databasemodelFromJson(jsonEncode(await fetchspecificContact(
        "${databasename.COLUMN_UPLOAD}= ?", ["0"], databasename.TABLE_PROCESS)));
    // List<Databasemodel> senderslis = senderslist.value;
    for(int i = 0; i < senderslist.length; i++){
      uploadtoserver({
        'sender': senderslist[i].code,
        'message': senderslist[i].response,
        'time': senderslist[i].timestamp,
      },senderslist[i]);
    }
  }

  var apicontroller = Get.put(ApiProvider(), permanent: true);

void uploadtoserver(Map body,dog)async{
  // isloading = true;
  var response = await apicontroller.posttokendetail(apicontroller.url+"hook/inbox",body);
  // isloading = false;
  apicontroller.loginprogress(response,success:(serverdata) async {
    Databasemodel sola = dog;
    sola.uploaded = "1";
    updateseen(dog);
  });
}
