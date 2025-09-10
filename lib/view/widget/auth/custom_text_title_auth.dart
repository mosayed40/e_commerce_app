import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String textTitle;
  const CustomTextTitleAuth({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle.tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
