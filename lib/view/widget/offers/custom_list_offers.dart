import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListOffers extends StatelessWidget {
  final ItemsModel listModel;

  const CustomListOffers({super.key, required this.listModel});
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
                  height: 125,
                  padding: EdgeInsets.only(left: 20),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLinkApi.imagesItems}/${listModel.itemsImage}",
                    height: 120,
                  ),
                ),
                // Title
                Text(
                  "${translateDatabase(listModel.itemsNameAr, listModel.itemsName)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Description
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${translateDatabase(listModel.itemsDascAr, listModel.itemsDasc)}",
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Price
                    Text(
                      "${listModel.itemsPrice! - (listModel.itemsPrice! * listModel.itemsDiscount! / 100)} \$",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${listModel.itemsPrice!} \$",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.buttonColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          controllerCart.addToCart(listModel.itemsId!);
                        },
                        icon: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,

          child: Image.asset(AppImageAsset.discount, width: 80),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF75044),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "-${listModel.itemsDiscount}%",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
