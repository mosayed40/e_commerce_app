import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/constant/app_theme.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  MyServices myServices = Get.find();
  ThemeData appThemeLanguage = themeEnglish;
  Locale? language;

  @override
  void onInit() {
    requestPermissionLocation();
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
    updateLangUI(langcode);
  }

  updateLangUI(String valLang) {
    // 👇 أضف هذا السطر لتحديث الواجهة
    final homeController = Get.find<HomeControllerImp>();
    final settingController = Get.find<SettingControllerImp>();
    homeController.lang = valLang;
    settingController.lang = valLang;
    update();
  }

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // التحقق من تفعيل خدمة الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبية", "الرجاء تفعيل خدمة تحدد الموقع");
    }
    // طلب الإذن من النظام
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبية", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("تنبية", "لا يمكن استخدام التطبيق بدون اللوكيشن ");
    }
  }
}
