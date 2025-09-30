import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShowQuatity extends GetView<ProductDetailsControllerImp> {
  const CustomShowQuatity({super.key});

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
          Spacer(),
          GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "${controller.showCount()}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
