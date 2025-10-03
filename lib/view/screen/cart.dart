import 'package:e_commerce_app/controller/cart_controller.dart';
// import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/widget/cart/custom_title_app_bar_cart.dart';
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
        title: const CustomTitleAppBarCart(title: "Shopping Cart "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const CustomItemOnProductCart(),
      ),
    );
  }
}
