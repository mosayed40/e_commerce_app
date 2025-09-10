import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "32".tr,
            style: TextStyle(color: AppColors.textColor_2, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 30),
            Icon(Icons.check_circle, size: 150, color: AppColors.primaryColor),
            Lottie.asset(AppImageAsset.verfiySuccess, height: 250, width: 250),
            // Icon(Icons.check_circle, size: 150, color: AppColors.primaryColor),
            Lottie.asset(AppImageAsset.verfiySuccess, height: 250, width: 250),
            // Icon(Icons.check_circle, size: 150, color: AppColors.primaryColor),
            SizedBox(height: 20),
            Text(
              "39".tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: CustomButtonAuth(
                text: "31",
                onPressed: () {
                  Get.offAllNamed(AppRoute.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
