import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomStatusOrder extends StatelessWidget {
  final String status;
  const CustomStatusOrder({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.buttonColor,
      ),
      child: Row(
        children: [
          Text(
            "statusOrder".tr,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(" : ", style: TextStyle(color: Colors.white)),
          Text(status, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
