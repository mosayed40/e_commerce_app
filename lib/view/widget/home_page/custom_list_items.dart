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
      height: 260,
      child: ListView.builder(
        itemCount: controller.itemsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Items(
            itemsModel: ItemsModel.fromJson(controller.itemsList[i]),
          );
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
    HomeControllerImp controllerHome = Get.put(HomeControllerImp());

    return InkWell(
      onTap: () {
        controllerHome.goToPageItemDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //========Images====================
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLinkApi.imagesItems}/${itemsModel.itemsImage}",
                      ),
                    ),
                  ),
                ),
                // ========Tile & Dascrption====================
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                        style: TextStyle(
                          color: AppColors.textColor_1,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Dascrption
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
                color: const Color(0xFFF75044),
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
          //=================== Price ==============
          Positioned(
            top: 120,
            right: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0x2A6300EE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "${itemsModel.itemsPrice! - (itemsModel.itemsPrice! * itemsModel.itemsDiscount! / 100)} \$",
                style: TextStyle(
                  color: const Color(0xFF40009A),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
