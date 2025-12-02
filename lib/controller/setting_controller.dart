import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logOut();
  goToViewAddress();
  goToViewOreder();
  goToViewOrederArchive();
  goToViewOffers();
}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();
  String? lang;

  @override
  void onInit() {
    lang = myServices.sharedPreferences.getString("lang");
    super.onInit();
  }

  @override
  logOut() {
    // int usersId = myServices.sharedPreferences.getInt("id")!;
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic(
    //   "user:${usersId.toString()}",
    // );
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  @override
  goToViewAddress() {
    Get.toNamed(AppRoute.viewAddress);
  }

  @override
  goToViewOreder() {
    Get.toNamed(AppRoute.pendingOrder);
  }

  @override
  goToViewOrederArchive() {
    Get.toNamed(AppRoute.archiveOrder);
  }

  @override
  goToViewOffers() {
    Get.toNamed(AppRoute.offers);
  }
}
