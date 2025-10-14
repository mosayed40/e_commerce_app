import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomIconBack(),
          Center(child: Text("Addresses Add")),
        ],
      ),
    );
  }
}
