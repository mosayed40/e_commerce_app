import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/data/data_source/remote/forget_password/verfiycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class VirfiyCodeController extends GetxController {
  checkCode();

  goToReastPassword(String verfiycode);
}

class VirfiyCodeControllerImp extends VirfiyCodeController {
  String? email;
  String? verifycode;
  VerfiyCodeForgetPassowrdData verfiycodeForgetPassword =
      VerfiyCodeForgetPassowrdData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void checkCode() {}

  @override
  void goToReastPassword(verfiycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiycodeForgetPassword.postData(email!, verifycode!);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.snackbar(
          "Warning",
          "Verfiycode Not Correct",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 174, 59, 51),
          colorText: Colors.white,
        );

        statusRequest = StatusRequest.failure;
      }
      update();
    }
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
