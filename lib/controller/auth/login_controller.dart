import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/auth/login.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> loginFormState = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late TextEditingController password;
  late TextEditingController email;
  List data = [];

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  login() async {
    var formData = loginFormState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences.setInt(
              "id",
              response['data']['users_id'],
            );
            // int usersId = myServices.sharedPreferences.getInt("id")!;
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

            // FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic(
            //   "user:${usersId.toString()}",
            // );

            Get.offAllNamed(AppRoute.home);
          } else {
            Get.toNamed(
              AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text},
            );
          }
        } else {
          Get.snackbar(
            "Warning",
            "Email Or Password Not Correct",
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
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.checkEmail);
  }

  @override
  onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
