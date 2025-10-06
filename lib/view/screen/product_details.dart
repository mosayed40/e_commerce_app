import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:e_commerce_app/view/widget/custom_icon_button.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_image_product_details.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_price_.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_product_price_and_count.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_products_color.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_show_quatity.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_title_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp = Get.put(
      ProductDetailsControllerImp(),
    );

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: CustomIconButton(
          onPressed: () {
            controllerImp.cartController.addToCart(
              controllerImp.itemsModel.itemsId!,
            );
          },
          icon: const Icon(Icons.add_shopping_cart_outlined),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDatatView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomImageProductDetails(
                      linkImage:
                          "${AppLinkApi.imagesItems}/${controller.itemsModel.categoriesImage}",
                    ),
                    const Positioned(
                      top: -25,
                      left: 10,
                      child: CustomIconBack(),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: CustomPrice(
                        price: "${controller.showPrice()}.00\$",
                      ),
                    ),
                  ],
                ),

                CustomTitleProductDetails(
                  title:
                      "${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                ),
                Text(
                  "${translateDatabase("حذاء رياضي خفيف ومريح، خامة عالية الجودة وتصميم أنيق يناسب التمرين والاستخدام اليومي.", "Lightweight and comfortable sports shoes, made of high-quality materials with a stylish design suitable for workouts and everyday use.")}",
                  // "${translateDatabase(controller.itemsModel.itemsDascAr, controller.itemsModel.itemsDasc)}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomProductPriceAndCouont(
                  iconAdd: () {
                    controller.addCount();
                  },
                  count: "${controller.countItems}",
                  iconRemove: () {
                    controller.removeCount();
                  },
                ),
                Text("Color", style: Theme.of(context).textTheme.titleLarge),
                const CustomProductsColor(),
                const CustomShowQuatity(count: "5"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
