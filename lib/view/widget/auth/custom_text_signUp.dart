import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:e_commerce_app/core/constant/colors.dart';

class CustomTextSignUp extends StatelessWidget {
  final String textBody;
  final String textLink;
  final void Function() onPressed;

  const CustomTextSignUp({
    super.key,
    required this.onPressed,
    required this.textBody,
    required this.textLink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textBody.tr,
          style: TextStyle(
            color: AppColors.textColor_2,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textLink.tr,
            style: TextStyle(
              color: AppColors.buttonColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
