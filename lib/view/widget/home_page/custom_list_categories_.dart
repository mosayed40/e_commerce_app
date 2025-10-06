import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/middle_ware/categories_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCategoriesHome extends GetView<HomeControllerImp> {
  const CustomListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: ListView.builder(
        itemCount: controller.categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModle: CategoriesModle.fromJson(
              controller.categoriesList[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends CustomListCategoriesHome {
  final CategoriesModle categoriesModle;
  final int i;
  const Categories({super.key, required this.categoriesModle, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categoriesList, i);
      },
      child: Column(
        children: [
          Container(
            height: 90,
            width: 105,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withValues(alpha: 0.2),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLinkApi.imagesCategoreis}/${categoriesModle.categoriesImage}",
              ),
            ),
          ),
          Text(
            "${translateDatabase(categoriesModle.categoriesNameAr, categoriesModle.categoriesName)}",
            style: const TextStyle(color: AppColors.textColor_2, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
