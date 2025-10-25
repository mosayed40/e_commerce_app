import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/widget/cart/custom_cart_app_bar.dart';
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
        automaticallyImplyLeading: false,
        title: CustomCartAppBar(title: "Shopping Cart"),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          onPressed: () {
            Get.toNamed(AppRoute.cartProductsDetails);
          },
          label: const Text(
            "Click ",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ControllerInCartImp>(
          builder: (controller) => ListView(
            children: [
              HandlingDatatView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 3.5,
                  ),
                  itemBuilder: (context, index) {
                    return CustomItemOnProductCart(
                      cartModel: controller.data[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
