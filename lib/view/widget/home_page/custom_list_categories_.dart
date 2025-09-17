import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
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
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModle: CategoriesModle.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModle categoriesModle;
  const Categories({super.key, required this.categoriesModle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 125,
          child: Stack(
            children: [
              Center(
                child: Image.network(
                  "${AppLinkApi.imagesCategoreis}/${categoriesModle.categoriesImage}",
                ),
              ),
              Positioned.fill(
                child: Container(
                  margin: const EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withValues(alpha: 0.1),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "${categoriesModle.categoriesName}",
          style: const TextStyle(color: AppColors.textColor_2, fontSize: 16),
        ),
      ],
    );
  }
}
