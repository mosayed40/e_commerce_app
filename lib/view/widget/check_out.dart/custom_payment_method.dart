import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomPaymentMethod extends StatelessWidget {
  final String title;
  final bool active;
  final void Function()? onPressed;
  const CustomPaymentMethod({
    super.key,
    required this.title,
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: active ? AppColors.buttonColor : const Color(0xE0B295F0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            color: active ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
