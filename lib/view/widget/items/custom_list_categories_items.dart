import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/middle_ware/categories_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCategoriesItemsPage extends GetView<ItemsControllerImp> {
  const CustomListCategoriesItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return SizedBox(
      width: 140,
      height: 140,
      child: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModle: CategoriesModle.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends CustomListCategoriesItemsPage {
  final CategoriesModle categoriesModle;
  final int i;
  const Categories({super.key, required this.categoriesModle, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i);
      },
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Column(
          children: [
            Container(
              height: 100,
              width: 125,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.selectedCat == i
                    ? AppColors.primaryColor.withValues(alpha: 0.3)
                    : Colors.grey.withValues(alpha: 0.2),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLinkApi.imagesCategoreis}/${categoriesModle.categoriesImage}",
                ),
              ),
            ),
            Text(
              "${categoriesModle.categoriesName}",
              style: TextStyle(
                color: controller.selectedCat == i
                    ? AppColors.primaryColor
                    : AppColors.textColor_2,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
