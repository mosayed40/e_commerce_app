import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:get/get.dart';

class CustomListItemsHome extends GetView<HomeControllerImp> {
  const CustomListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Items(itemsModel: ItemsModel.fromJson(controller.items[i]));
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              //========Images====================
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLinkApi.imagesItems}/${itemsModel.itemsImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // ========Text & price====================
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "${translateDatabase(itemsModel.categoriesNameAr, itemsModel.categoriesName)}",
                      style: TextStyle(
                        color: AppColors.textColor_1,
                        fontSize: 16,
                      ),
                    ),
                    // Dascrption
                    Text(
                      "${translateDatabase(itemsModel.itemsDascAr, itemsModel.itemsDasc)}",
                      style: TextStyle(
                        color: AppColors.textColor_2,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Price
                    Text(
                      "${itemsModel.itemsPrice}\$",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ========Discount badge====================
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "-${itemsModel.itemsDiscount}%",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
