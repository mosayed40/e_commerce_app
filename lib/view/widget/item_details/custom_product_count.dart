import 'package:flutter/material.dart';

class CustomProductCouont extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;

  const CustomProductCouont({
    super.key,
    required this.onAdd,
    required this.onRemove,
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
              IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
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
              IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
