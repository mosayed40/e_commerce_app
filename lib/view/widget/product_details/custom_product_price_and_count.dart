import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductPriceAndCouont extends GetView<ProductDetailsControllerImp> {
  const CustomProductPriceAndCouont({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.addCount();
                },
                icon: Icon(Icons.add),
              ),
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color(0xFFCCCACA),
                ),
                child: Text(
                  "${controller.number}",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.removeCount();
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "${controller.itemsModel.itemsPrice}.00\$",
            style: TextStyle(color: AppColors.primaryColor, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
