import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomOrderid extends StatelessWidget {
  final String orderId;
  const CustomOrderid({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "orderId".tr,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Text(
            " :       $orderId",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
