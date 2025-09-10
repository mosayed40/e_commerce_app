import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/data/data_source/remote/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';

abstract class SignupController extends GetxController {
  signUp();

  goToSignIN();
}

class SignUpControllerImp extends SignupController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signUpData = SignUpData(Get.find<Crud>());

  List data = [];

  @override
  void signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      statusRequest = handingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          // data.addAll(response);
          Get.offNamed(
            AppRoute.verfiyCodeSignUp,
            arguments: {"email": email.text},
          );
        } else {
          Get.snackbar(
            "Warning",
            "Phone number or email already exists",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color.fromARGB(255, 174, 59, 51),
            colorText: Colors.white,
          );
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  @override
  void goToSignIN() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.onClose();
  }
}
