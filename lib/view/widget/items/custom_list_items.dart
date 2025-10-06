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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Rating"),
                  const SizedBox(width: 15),
                  const Text(
                    "4.5",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          // color: Colors.amber,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Price
                  Text(
                    "${itemsModel.itemsPrice} \$",
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(width: 20),
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
                  // Add To Cart
                  IconButton(
                    onPressed: () {
                      controllerCart.addToCart(itemsModel.itemsId!);
                    },
                    icon: const Icon(Icons.add_shopping_cart_outlined),
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
