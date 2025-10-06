import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:e_commerce_app/view/widget/custom_search_text_form_field.dart';
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

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              SizedBox(width: 25),
              CustomIconBack(),
              Spacer(),
              Container(
                width: 350,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomSearchTextFormField(
                  hintText: "Search For Products",
                  onPressed: () {},
                ),
              ),
            ],
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            padding: EdgeInsets.all(15),
            children: [
              const SizedBox(height: 20),
              const CustomListCategoriesItemsPage(),
              GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDatatView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
        ),
      ],
    );
  }
}
