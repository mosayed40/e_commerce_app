import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "32".tr,
          style: const TextStyle(color: AppColors.textColor_2, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Lottie.asset(
                AppImageAsset.verfiySuccess,
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 20),
              Text(
                "37".tr,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Text(
                  "44".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: CustomButtonAuth(
                  text: "31",
                  onPressed: () {
                    Get.offNamed(AppRoute.login);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
