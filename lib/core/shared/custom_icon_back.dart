import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color(0xB3BACAEC),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        Positioned(
          top: -2,
          right: -5,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.chevron_left,
              color: const Color(0xFFFFFFFF),
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
