import 'package:e_commerce_app/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLangSetting extends GetView<LocaleController> {
  const CustomLangSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              controller.changeLange("ar");
            },
            icon: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF7139BF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("ع", style: TextStyle(color: Colors.white)),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.changeLange("en");
            },
            icon: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF7139BF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("En", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
