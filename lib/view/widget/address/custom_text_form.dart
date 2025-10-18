import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:e_commerce_app/core/constant/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? valid;

  const CustomTextForm({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: controller,
      keyboardType: TextInputType.multiline,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText.tr,
        hintStyle: const TextStyle(color: AppColors.textColor_2, fontSize: 14),
        labelText: labelText.tr,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.buttonColor),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
