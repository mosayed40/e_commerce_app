import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomEnterDiscountCoupon extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final void Function()? onPressed;
  const CustomEnterDiscountCoupon({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsetsDirectional.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: onPressed,
            icon: const Icon(Icons.local_offer, color: Colors.white, size: 24),
            label: Text(
              labelText,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
