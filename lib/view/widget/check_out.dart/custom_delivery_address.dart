import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomDeliveryAddress extends StatelessWidget {
  final String titleAddress;
  final String governorate;
  final String address;
  final String phone;
  final bool active;
  final void Function()? onTap;

  const CustomDeliveryAddress({
    super.key,
    required this.titleAddress,
    required this.governorate,
    required this.address,
    required this.phone,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: active ? AppColors.primaryColor : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                titleAddress,
                style: TextStyle(color: active ? Colors.white : Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    governorate,
                    style: TextStyle(color: active ? Colors.grey[500] : null),
                  ),
                  Text(
                    address,
                    style: TextStyle(color: active ? Colors.grey[500] : null),
                  ),
                  Text(
                    phone,
                    style: TextStyle(color: active ? Colors.grey[500] : null),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
