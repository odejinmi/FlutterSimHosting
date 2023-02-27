import '../../app/modules/messagedetails_module/messagedetails_page.dart';
import '../../app/modules/messagedetails_module/messagedetails_bindings.dart';
import '../../app/modules/splashscreen_module/splashscreen_page.dart';
import '../../app/modules/splashscreen_module/splashscreen_bindings.dart';
import '../../app/modules/mainpage_module/mainpage_page.dart';
import '../../app/modules/mainpage_module/mainpage_bindings.dart';
import '../../app/modules/loginscreen_module/loginscreen_bindings.dart';
import '../../app/modules/loginscreen_module/loginscreen_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';
/// GetX Generator - fb.com/htngu.99
///

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGINSCREEN,
      page: () => const loginscreenPage(),
      binding: loginscreenBinding(),
    ),
    GetPage(
      name: Routes.MAINPAGE,
      page: () => MainpagePage(),
      binding: MainpageBinding(),
    ),
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: Routes.MESSAGEDETAILS,
      page: () => messagedetailsPage(),
      binding: messagedetailsBinding(),
    ),
  ];
}
