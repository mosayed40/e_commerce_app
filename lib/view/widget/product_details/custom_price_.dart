import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomPrice extends StatelessWidget {
  final String price;
  const CustomPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(210, 185, 227, 250),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        price,
        style: TextStyle(color: AppColors.primaryColor, fontSize: 24),
      ),
    );
  }
}
