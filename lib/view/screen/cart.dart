import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/shared/custom_button.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/view/widget/cart/custom_item_on_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends GetView<ControllerInCartImp> {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerInCartImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: const [
          Expanded(child: CustomTitlePage(title: "titlePageShoppingCart")),
        ],
      ),
      bottomNavigationBar: CustomButton(
        labelText: "Go To Check Out",
        onPressed: () {
          controller.goToCheckOut();
        },
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
