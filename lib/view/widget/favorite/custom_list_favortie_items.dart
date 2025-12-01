import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/middle_ware/myfavorite_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<FavoriteControllerImp> {
  final MyfavoriteModel favoriteModel;
  const CustomListFavoriteItems({super.key, required this.favoriteModel});
  @override
  Widget build(BuildContext context) {
    ControllerInCartImp controllerCart = Get.put(ControllerInCartImp());
    return Stack(
      children: [
        Card(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLinkApi.imagesItems}/${favoriteModel.itemsImage}",
                    height: 100,
                  ),
                ),
                // Title
                Text(
                  "${translateDatabase(favoriteModel.itemsNameAr, favoriteModel.itemsName)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Description
                SizedBox(
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      "${translateDatabase(favoriteModel.itemsDascAr, favoriteModel.itemsDasc)}",
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Price
                    Text(
                      "${favoriteModel.itemsPrice} \$",
                      style: const TextStyle(color: AppColors.primaryColor),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(
                          favoriteModel.favoriteId!,
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 125,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.buttonColor,
            ),
            child: IconButton(
              onPressed: () {
                controllerCart.addToCart(favoriteModel.itemsId!);
              },
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
