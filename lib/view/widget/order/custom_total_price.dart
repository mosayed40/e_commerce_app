import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomTotalPriceOrder extends StatelessWidget {
  final String totalPrice;
  const CustomTotalPriceOrder({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "totalPrice".tr,
            style: TextStyle(color: const Color(0xFF0B02BD), fontSize: 20),
          ),
          Text(
            "$totalPrice \$",
            style: TextStyle(color: const Color(0xFF0B02BD), fontSize: 20),
          ),
        ],
      ),
    );
  }
}
