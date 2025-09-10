import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:e_commerce_app/core/constant/colors.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? suffixIcon;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.myController,
    required this.valid,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: myController,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText.tr,
        hintStyle: const TextStyle(color: AppColors.textColor_2, fontSize: 14),
        suffixIcon: InkWell(onTap: onTapIcon, child: Icon(suffixIcon)),
        labelText: labelText.tr,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.buttonColor),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
