// ignore_for_file: file_names

import 'package:e_commerce_app/core/shared/custom_title_page.dart';
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
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [Expanded(flex: 4, child: CustomTitlePage(title: "32"))],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Lottie.asset(
                AppImageAsset.verfiySuccess,
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 20),
              Text(
                "39".tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
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
      ),
    );
  }
}
