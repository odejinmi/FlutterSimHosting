import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class Globalvariable extends GetxController{
  var _token = "".obs;
  set token(value) => _token.value = value;
  get token => _token.value;

  var _isInForeground = true.obs;
  set isInForeground(value) => _isInForeground.value = value;
  get isInForeground => _isInForeground.value;

  // var prefs = GetStorage();

  // getfromstorage(){
  //   token = prefs.read('token')??"";
  // }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

openbrowser(url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw "Could not launch $url";
  }
}
// bool isInForeground = true;
// String token = "";