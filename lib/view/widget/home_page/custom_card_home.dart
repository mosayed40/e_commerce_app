import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String subTitle;
  const CustomCardHome({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor_2,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: const TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: controller.lang == "ar" ? -22 : null,
            right: controller.lang == "en" ? -22 : null,
            child: Container(
              height: 180,
              width: 180,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: AppColors.textColor_2,
              ),
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.hardEdge,
              child: Center(
                child: controller.itemsList[1]['items_image'] == null
                    ? Icon(Icons.image_outlined)
                    : Container(
                        margin: EdgeInsets.only(top: 15),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLinkApi.imagesItems}/${controller.itemsList[1]['items_image']}",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
