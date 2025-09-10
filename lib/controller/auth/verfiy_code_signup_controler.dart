import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/data/data_source/remote/auth/verfiycode_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class VirfiyCodeSignUpController extends GetxController {
  checkCode();

  goToSuccessSignUp(String verfiycodeSignup);
}

class VirfiyCodeSignUpControllerImp extends VirfiyCodeSignUpController {
  VerfiycodeSignUpData verfiycodeSignUpData = VerfiycodeSignUpData(
    Get.find<Crud>(),
  );
  StatusRequest statusRequest = StatusRequest.none;

  String? email;
  @override
  void checkCode() {}

  @override
  void goToSuccessSignUp(verfiycodeSignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiycodeSignUpData.postData(
      email!,
      verfiycodeSignup,
    );
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
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
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
