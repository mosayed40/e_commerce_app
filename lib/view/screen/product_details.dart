import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:e_commerce_app/view/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    ControllerInCartImp controllerCart = Get.put(ControllerInCartImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [
          CustomIconBack(),
          SizedBox(width: 100),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 90),
            child: Text(
              "تفاصيل المنتج",
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: CustomIconButton(
          onPressed: () {
            controllerCart.refresData();
            Get.toNamed(AppRoute.shoppingCartPage);
          },
          icon: const Icon(Icons.add_shopping_cart_outlined),
        ),
      ),

      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) {
          if (controller.itemsModel == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final item = controller.itemsModel!;
          return SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                          image: DecorationImage(
                            image: NetworkImage(
                              "${AppLinkApi.imagesItems}/${item.itemsImage}",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        item.itemsName ?? "بدون اسم",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.itemsDasc ?? "لا يوجد وصف متاح",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Count",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => controller.removeCount(),
                              ),
                              Text("${controller.countItems}"),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => controller.addCount(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Price",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),

                      Row(
                        children: [
                          // السعر بعد الخصم
                          Text(
                            "${item.itemsPrice! - (item.itemsPrice! * item.itemsDiscount! / 100)}  ج.م",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 20),
                          // السعر قبل الخصم
                          item.itemsDiscount! > 0
                              ? Text(
                                  "${item.itemsPrice! - (item.itemsPrice! * item.itemsDiscount! / 100)} ج.م",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : Text(""),
                        ],
                      ),
                    ],
                  ),
                ),
                if (item.itemsDiscount != 0)
                  Image.asset(AppImageAsset.discount, width: 120),
              ],
            ),
          );
        },
      ),
    );
  }
}
