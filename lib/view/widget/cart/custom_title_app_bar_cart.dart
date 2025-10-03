import 'package:flutter/material.dart';

class CustomTitleAppBarCart extends StatelessWidget {
  final String title;
  const CustomTitleAppBarCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,

        style: TextStyle(fontSize: 30, color: Colors.grey[600]),
      ),
    );
  }
}
