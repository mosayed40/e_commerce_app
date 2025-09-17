import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomCardHome({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor_2,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: const TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: AppColors.textColor_2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
