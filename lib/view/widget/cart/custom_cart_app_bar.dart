import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';

class CustomCartAppBar extends StatelessWidget {
  final String title;
  const CustomCartAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      actions: [
        CustomIconBack(),
        Spacer(),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 90),
          child: Text(
            title,
            style: TextStyle(color: Colors.grey[600], fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
