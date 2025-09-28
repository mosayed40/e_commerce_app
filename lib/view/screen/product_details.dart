import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_product_price_and_count.dart';
import 'package:e_commerce_app/view/widget/product_details/custom_products_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(
      ProductDetailsControllerImp(),
    );
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: CustomButtonAuth(onPressed: () {}, text: "Add To Card"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(height: 60),
            // Image ====>
            Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLinkApi.imagesItems}/${controller.itemsModel.categoriesImage}",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "${translateDatabase(controller.itemsModel.categoriesNameAr, controller.itemsModel.categoriesName)}",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 15),
            Text(
              "${translateDatabase("حذاء رياضي خفيف ومريح، خامة عالية الجودة وتصميم أنيق يناسب التمرين والاستخدام اليومي.", "Lightweight and comfortable sports shoes, made of high-quality materials with a stylish design suitable for workouts and everyday use.")}",

              // "${translateDatabase(controller.itemsModel.itemsDascAr, controller.itemsModel.itemsDasc)}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const CustomProductPriceAndCouont(),
            const Text(
              "Color",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const CustomProductsColor(),
          ],
        ),
      ),
    );
  }
}
