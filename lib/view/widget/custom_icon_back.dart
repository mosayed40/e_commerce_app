import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xB3012F92),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),

      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.chevron_left,
          color: const Color(0xFFFFFFFF),
          size: 35,
        ),
      ),
    );
  }
}
