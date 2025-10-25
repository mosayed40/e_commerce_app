import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonShoppingCart extends StatelessWidget {
  final String labelText;
  final void Function()? onPressed;
  const CustomButtonShoppingCart({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50, bottom: 30),
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: onPressed,
        label: Text(
          labelText,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
