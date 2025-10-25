import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/data/data_source/remote/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class ReastPasswordController extends GetxController {
  resetPassword();
}

class ReastPasswordControllerImp extends ReastPasswordController {
  GlobalKey<FormState> resetPasswordFormState = GlobalKey<FormState>();
  ResetPassowrdData resetPassowrdData = ResetPassowrdData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void resetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
        title: "Error",
        middleText: "Password Not Match",
      );
    }
    var formData = resetPasswordFormState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPassowrdData.postData(email!, password.text);
      statusRequest = handingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.snackbar(
            "Warning",
            "Try Again ",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFFAE3B33),
            colorText: Colors.white,
          );
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  @override
  void onClose() {
    password.dispose();
    repassword.dispose();
    super.onClose();
  }
}
