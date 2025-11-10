import 'package:flutter/material.dart';

class CustomBodyTable extends StatelessWidget {
  final String value;
  const CustomBodyTable({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(value, textAlign: TextAlign.start);
  }
}
