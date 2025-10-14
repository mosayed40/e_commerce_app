import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        actions: [
          CustomIconBack(),
          SizedBox(width: 30),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "View Addresses",
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonColor,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Center(child: Text("Hello world")),
    );
  }
}
