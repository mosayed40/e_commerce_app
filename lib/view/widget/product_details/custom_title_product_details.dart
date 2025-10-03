import 'package:flutter/material.dart';

class CustomTitleProductDetails extends StatelessWidget {
  final String title;
  const CustomTitleProductDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
