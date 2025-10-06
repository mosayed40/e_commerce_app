import 'package:flutter/material.dart';

class CustomProductPriceAndCouont extends StatelessWidget {
  final void Function()? iconAdd;
  final void Function()? iconRemove;
  final String count;

  const CustomProductPriceAndCouont({
    super.key,
    required this.iconAdd,
    required this.iconRemove,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Row(
            children: [
              // Add
              IconButton(onPressed: iconAdd, icon: Icon(Icons.add)),
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: const Color(0xFFCCCACA),
                ),
                child: Text(count, style: TextStyle(color: Colors.black)),
              ),
              // Remove
              IconButton(onPressed: iconRemove, icon: Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
