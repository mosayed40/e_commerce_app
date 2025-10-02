import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logOut();
}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();

  @override
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
