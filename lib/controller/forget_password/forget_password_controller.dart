import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/data/data_source/remote/forget_password/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> forgetPassfFormState = GlobalKey<FormState>();
  CheckEmailData checkEamilDatat = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void checkEmail() async {
    var formData = forgetPassfFormState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEamilDatat.postData(email.text);
      statusRequest = handingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(
            AppRoute.verfiyCodeForgetPassword,
            arguments: {"email": email.text},
          );
        } else {
          Get.snackbar(
            "Warning",
            "Email Not Found ",
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
    email.dispose();
    super.onClose();
  }
}
