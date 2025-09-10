// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/on_boarding_controller.dart';
import 'package:e_commerce_app/view/widget/on_boarding/custom_button.dart';
import 'package:e_commerce_app/view/widget/on_boarding/custom_slider.dart';
import 'package:e_commerce_app/view/widget/on_boarding/dot_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());

    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 3, child: CustomSilder()),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: const [
                  CustomDotController(),
                  SizedBox(height: 50),
                  CustomButton(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
