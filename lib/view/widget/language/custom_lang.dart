import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/constant/colors.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        color: AppColors.primaryColor,
        minWidth: double.infinity,
        onPressed: onPressed,

        child: Text(textButton, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
