import 'package:flutter/material.dart';

class CustomCartAppBar extends StatelessWidget {
  final String title;
  const CustomCartAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(color: Colors.grey[600], fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
