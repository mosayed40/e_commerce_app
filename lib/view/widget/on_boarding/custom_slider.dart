import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/on_boarding_controller.dart';
import 'package:e_commerce_app/data/data_source/static/static.dart';

class CustomSilder extends GetView<OnBoardingControllerImp> {
  const CustomSilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(height: 100),
          Text(
            "${onBoardingList[i].title}",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          Image.asset(
            onBoardingList[i].image!,
            height: 350,
            width: double.infinity,
          ),
          // Spacer(),
          Container(
            margin: EdgeInsetsDirectional.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              '${onBoardingList[i].body}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
