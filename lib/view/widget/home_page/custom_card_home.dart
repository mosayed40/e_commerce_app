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
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr,
                    style: const TextStyle(
                      color: AppColors.textColor_2,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subTitle.tr,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<HomeControllerImp>(
            builder: (controller) => Positioned(
              top: -15,
              left: controller.lang == "ar" ? -20 : null,
              right: controller.lang == "en" ? -20 : null,
              child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: AppColors.textColor_2,
                ),
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.hardEdge,
                child: Center(
                  child: controller.itemsList.isEmpty
                      ? Icon(Icons.image_outlined, size: 100)
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
          ),
        ],
      ),
    );
  }
}
