import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(langAr, langEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return langAr;
  } else {
    return langEn;
  }
}
