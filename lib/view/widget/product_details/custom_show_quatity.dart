import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShowQuatity extends GetView<ProductDetailsControllerImp> {
  final String count;
  const CustomShowQuatity({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Text(
            "Quantity Available",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(count, style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
      ),
    );
  }
}
