import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
        iconSize: 30,
      ),
    );
  }
}
