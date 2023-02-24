import 'package:get/get.dart';

import '../../app/translations/en_US/en_us_translations.dart';
import '../../app/translations/vi_VN/vi_vn_translations.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AppTranslation extends Translations {
  static Map<String, Map<String, String>> translations = {
    'en': enUs,
    'vi': viVn,
  };

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en': enUs,
    'vi': viVn,
  };
}