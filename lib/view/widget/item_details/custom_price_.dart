import 'package:flutter/material.dart';

class CustomPrice extends StatelessWidget {
  final String price;
  const CustomPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0x2A6300EE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        price,
        style: TextStyle(
          color: const Color(0xFF40009A),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
