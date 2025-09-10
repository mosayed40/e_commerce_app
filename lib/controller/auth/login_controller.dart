import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List data = [];
  late TextEditingController email;
  late TextEditingController password;

  @override
  void login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setInt(
            "id",
            response['data']['users_id'],
          );
          myServices.sharedPreferences.setString(
            "username",
            response['data']['users_name'],
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']['users_email'],
          );
          myServices.sharedPreferences.setInt(
            "phone",
            response['data']['users_phone'],
          );
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.home);
        } else {
          Get.snackbar(
            "Warning",
            "Email Or Password Not Correct",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFFAE3B33),
            colorText: Colors.white,
          );

          statusRequest = StatusRequest.failure;
          print("failure=============== Login ====================");
        }
      }
    }
    update();
  }

  @override
  void goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(
        "-============== Firebase Messaging Login =======================-",
      );
      String? token = value;
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
