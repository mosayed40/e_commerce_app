import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleTabel extends StatelessWidget {
  final String titleColumn;
  const CustomTitleTabel({super.key, required this.titleColumn});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleColumn.tr,
      style: TextStyle(color: const Color(0xFF0B02BD)),
      textAlign: TextAlign.start,
    );
  }
}
