import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel;
  final int i;
  const CustomListItems({super.key, required this.itemsModel, required this.i});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.grey.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withValues(alpha: 0.2),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLinkApi.imagesItems}/${itemsModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              // Title
              Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Description
              Text(
                "${itemsModel.itemsDasc}",
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Rating"),
                  const SizedBox(width: 5),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Price
                  Text(
                    "${itemsModel.itemsPrice} \$",
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      controller.statusFavorite(i);
                    },
                    color: controller.index == i
                        ? AppColors.errorColor
                        : Colors.grey[900],
                    icon: controller.index == i
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                  ),
                  const Icon(Icons.add_shopping_cart_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
