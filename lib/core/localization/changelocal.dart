import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/constant/app_theme.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  MyServices myServices = Get.find();
  ThemeData appThemeLanguage = themeEnglish;
  Locale? language;

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appThemeLanguage = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appThemeLanguage = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appThemeLanguage = themeEnglish;
    }
    super.onInit();
  }

  changeLange(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appThemeLanguage = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appThemeLanguage);
    Get.updateLocale(locale);
  }
}
