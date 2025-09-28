import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductsColor extends GetView<ProductDetailsControllerImp> {
  const CustomProductsColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          4,
          (index) => Column(
            children: [
              Container(
                width: 25,
                height: 25,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.grey,
                ),
              ),
              Text("${controller.data[index]["name"]}"),
            ],
          ),
        ),
      ],
    );
  }
}
