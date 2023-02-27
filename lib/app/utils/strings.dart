import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

String home = 'Home';
String login = 'Login';
String kindlylogin = 'Kindlylogin';
String letconnect = 'Letconnect';
String swipeleft = 'Swipeleft';
String enterserverid = 'Enterserverid';
String this_field_can = 'this_field_can';
String youhaveno = 'youhaveno';
bool isInForeground = true;
// String token = "aZ6eYmD0qXEvC3t9YZBtn4INopZiMP3K7zu2pbiZSpdbTZa3e9WIsWvwcCJ6";

Future<String> token() async {
  var prefs = GetStorage();
  final String? action1 = prefs.read('token');
  print("action1");
  print(action1);

// Obtain shared preferences.
  final pref = await SharedPreferences.getInstance();
  await pref.reload();
  // Try reading data from the 'action' key. If it doesn't exist, returns null.
  final String? action = pref.getString('token');
  print("action");
  print(action);
  return action ?? action1 ?? "you" ;
}
removetoken() async {
  final pref = await SharedPreferences.getInstance();
  pref.remove('token');
  var prefs = GetStorage();
  prefs.remove('token');
}

//database section;
class databasename {
  static const String TABLE_PROCESS = "process";
  static const String COLUMN_PROCESSID = "processId";
  static const String COLUMN_TYPE = "type";
  static const String COLUMN_CODE = "code";
  static const String COLUMN_RESPONSE = "response";
  static const String COLUMN_PROCESSREFRENCE = "reference";
  static const String COLUMN_SEEN = "seen";
  static const String COLUMN_TIMESTAMP = "timestamp";
  static const String COLUMN_UPLOAD = "upload";
}


openbrowser(url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw "Could not launch $url";
  }
}