import 'package:flutter/material.dart';

class CustomTitlePage extends StatelessWidget {
  final String title;
  const CustomTitlePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
