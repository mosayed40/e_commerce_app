import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/localization/changelocal.dart';
import 'package:e_commerce_app/view/widget/custom_app_bar.dart';
import 'package:e_commerce_app/view/widget/home_page/custom_card_home.dart';
import 'package:e_commerce_app/view/widget/home_page/custom_list_categories_.dart';
import 'package:e_commerce_app/view/widget/home_page/custom_list_items.dart';
import 'package:e_commerce_app/view/widget/home_page/custom_title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<LocaleController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDatatView(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const SizedBox(height: 25),
              CustomAppBar(
                titleAppBar: "search",
                onPressedSearch: () {},
                onPressedIcon: () {},
                onPressedFavorite: () {
                  controller.goToMyfavorite();
                },
              ),
              const SizedBox(height: 20),
              const CustomCardHome(
                title: "A summer surprise",
                subTitle: "Cash back 25%",
              ),
              const CustomTitleHome(title: "titleCat"),
              const CustomListCategoriesHome(),
              const CustomTitleHome(title: "titleItem"),
              const CustomListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
