import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';

class EidtAddress extends StatelessWidget {
  const EidtAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomIconBack(),
          Center(child: Text("Addresses Eidt")),
        ],
      ),
    );
  }
}
