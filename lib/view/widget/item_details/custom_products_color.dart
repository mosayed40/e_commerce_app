import 'package:e_commerce_app/controller/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductsColor extends GetView<ItemDetailsControllerImp> {
  const CustomProductsColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.data.length,
          (index) => Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 25,
                  height: 25,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color(controller.data[index]["color"]),
                  ),
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
