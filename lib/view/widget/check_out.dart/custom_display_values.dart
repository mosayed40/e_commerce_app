import 'package:flutter/material.dart';

class CustomDisplayValues extends StatelessWidget {
  final String title;
  final String value;
  const CustomDisplayValues({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
