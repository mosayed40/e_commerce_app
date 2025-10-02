import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/view/widget/custom_app_bar.dart';
import 'package:e_commerce_app/view/widget/items/custom_list_categories_items.dart';
import 'package:e_commerce_app/view/widget/items/custom_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFavorite = Get.put(FavoriteControllerImp());
    HomeControllerImp controllerHome = Get.put(HomeControllerImp());

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          const SizedBox(height: 60),
          CustomAppBar(
            titleAppBar: "search",
            onPressedSearch: () {},
            onPressedIcon: () {},
            onPressedFavorite: () {
              controllerHome.goToMyfavorite();
            },
          ),
          const SizedBox(height: 20),
          const CustomListCategoriesItemsPage(),
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => HandlingDatatView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                shrinkWrap: true,
                itemCount: controller.data.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (BuildContext context, index) {
                  controllerFavorite.isFavorite[controller
                          .data[index]['items_id']] =
                      controller.data[index]['favorite'];
                  return CustomListItems(
                    itemsModel: ItemsModel.fromJson(controller.data[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
