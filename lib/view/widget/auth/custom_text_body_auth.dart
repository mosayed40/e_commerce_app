import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textBody;
  const CustomTextBodyAuth({super.key, required this.textBody});

  @override
  Widget build(BuildContext context) {
    return Text(
      textBody.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey[400],
      ),
    );
  }
}
