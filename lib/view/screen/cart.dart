import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/view/widget/cart/custom_item_on_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerInCartImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Shopping Cart",
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const CustomItemOnProductCart(),
      ),
    );
  }
}
