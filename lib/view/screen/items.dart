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
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => HandlingDatatView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: EdgeInsets.all(15),
            children: [
              const SizedBox(height: 60),
              CustomAppBar(
                titleAppBar: "Search Items",
                onPressedSearch: () {},
                onPressedIcon: () {},
              ),
              const SizedBox(height: 20),
              const CustomListCategoriesItemsPage(),
              GridView.builder(
                shrinkWrap: true,
                // Items Linght
                itemCount: controller.data.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (BuildContext context, index) {
                  return CustomListItems(
                    i: index,
                    itemsModel: ItemsModel.fromJson(controller.data[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
