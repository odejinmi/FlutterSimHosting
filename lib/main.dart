import 'package:flutter/material.dart';
import 'package:fluttersimhosting/app/data/provider/networkProvider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'app/translations/app_translations.dart';
import 'app/utils/strings.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

var prefs = GetStorage();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    token = prefs.read('token')??"you";
    return GetMaterialApp(
        translations: AppTranslation(),
        locale: Get.deviceLocale,
      title: 'Flutter Demo',
      theme: appThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashscreen',
        getPages: AppPages.pages,
        initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => NetworkProvider(), fenix: true);
      // Get.lazyPut(() => ApiProvider(), fenix: true);
      // Get.find<VpnProvider>().initialize();
    }),
    );
  }
}
