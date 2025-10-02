import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class CheckEamilController extends GetxController {
  checkEmail();
  goToVerfiyCodeSignUp();
}

class CheckEamilControllerImp extends CheckEamilController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void checkEmail() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToVerfiyCodeSignUp();
    } else {
      Get.snackbar("Error", "Please fill in the email correctly");
    }
  }

  @override
  void goToVerfiyCodeSignUp() {
    Get.offNamed(AppRoute.verfiyCodeSignUp);
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
