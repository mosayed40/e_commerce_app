import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTotalPrice extends StatelessWidget {
  final String title;
  final String price;
  const CustomTotalPrice({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 24.0),
        ),
        Text(
          price,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 24.0),
        ),
      ],
    );
  }
}
