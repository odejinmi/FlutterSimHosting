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
String token = "aZ6eYmD0qXEvC3t9YZBtn4INopZiMP3K7zu2pbiZSpdbTZa3e9WIsWvwcCJ6";

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