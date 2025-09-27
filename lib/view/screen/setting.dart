import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/localization/changelocal.dart';
import 'package:e_commerce_app/view/widget/language/custom_lang.dart';

class Setting extends GetView<LocaleController> {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            CustomButtonLang(
              textButton: "button1".tr,
              onPressed: () {
                controller.changeLange("ar");
                Get.toNamed(AppRoute.home);
                controller.update();
              },
            ),
            SizedBox(height: 10),
            CustomButtonLang(
              textButton: "button2".tr,
              onPressed: () {
                controller.changeLange("en");
                Get.toNamed(AppRoute.home);
                controller.update();
              },
            ),
          ],
        ),
      ),
    );
  }
}
