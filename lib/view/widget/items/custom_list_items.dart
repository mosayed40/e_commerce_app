import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    ControllerInCartImp controllerCart = Get.put(ControllerInCartImp());

    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLinkApi.imagesItems}/${itemsModel.itemsImage}",
                  height: 100,
                  // fit: BoxFit.fill,
                ),
              ),
              const Spacer(),
              // Title
              Text(
                "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              // Description
              SizedBox(
                width: 200,
                height: 60,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "${translateDatabase(itemsModel.itemsDascAr, itemsModel.itemsDasc)}",
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index < 3 ? Colors.amber : Colors.black,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 25),
                  // Add To Cart
                  IconButton(
                    onPressed: () {
                      controllerCart.addToCart(itemsModel.itemsId!);
                    },
                    icon: const Icon(Icons.add_shopping_cart_outlined),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  // Price
                  itemsModel.itemsDiscount! > 0
                      ? Column(
                          children: [
                            // السعر بعد الخصم
                            Text(
                              "${itemsModel.itemsPrice! - (itemsModel.itemsPrice! * itemsModel.itemsDiscount! / 100)} ج.م",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            // السعر قبل الخصم
                            Text(
                              "${itemsModel.itemsPrice! - (itemsModel.itemsPrice! * itemsModel.itemsDiscount! / 100)}ج.م",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "${itemsModel.itemsPrice! - (itemsModel.itemsPrice! * itemsModel.itemsDiscount! / 100)}ج.م",
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            // decoration: TextDecoration.lineThrough,
                          ),
                        ),
                  const SizedBox(width: 25),
                  GetBuilder<FavoriteControllerImp>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        if (controller.isFavorite[itemsModel.itemsId] == 1) {
                          controller.setFavorite(itemsModel.itemsId, 0);
                          controller.removeFavorite(itemsModel.itemsId!);
                        } else {
                          controller.setFavorite(itemsModel.itemsId, 1);
                          controller.addFavorite(itemsModel.itemsId!);
                        }
                      },
                      icon: controller.isFavorite[itemsModel.itemsId] == 1
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border_outlined),
                      color: AppColors.errorColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
