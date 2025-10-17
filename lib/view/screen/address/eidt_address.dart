import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';

class EidtAddress extends StatelessWidget {
  const EidtAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        actions: [
          CustomIconBack(),
          SizedBox(width: 20),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              "Edit Addresses",
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: Center(child: Text("Edit")),
    );
  }
}
