import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/localization/changelocal.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:e_commerce_app/view/widget/home_page/custom_app_bar.dart';
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
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: AppColors.backgroundAppBar,
          actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          actions: [
            Expanded(
              child: CustomAppBar(
                myController: controller.search!,
                titleAppBar: "search",
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedSearch: () {
                  controller.onSearch();
                },
                onPressedNotifications: () {
                  print("Notification");
                },
                onPressedFavorite: () {
                  print("person");
                },
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              controller.isSearch
                  ? ListItemsSearch(listDataModel: controller.listData)
                  : HandlingDatatView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 20),
                          CustomCardHome(
                            title: "titleCardHome",
                            subTitle: "subtitleCardHome",
                          ),
                          CustomTitleHome(title: "titleCat"),
                          CustomListCategoriesHome(),
                          CustomTitleHome(title: "titleItem"),
                          CustomListItemsHome(),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataModel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            controller.goToPageItemDetails(listDataModel[i]);
          },
          child: Card(
            child: Row(
              children: [
                // image
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLinkApi.imagesItems}/${listDataModel[i].itemsImage}",
                        height: 90,
                      ),
                    ),
                  ),
                ),
                // title && price
                Expanded(
                  flex: 4,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "${translateDatabase(listDataModel[i].itemsNameAr, listDataModel[i].itemsName)}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text("Price : "),
                            SizedBox(width: 20),
                            Text(
                              "${listDataModel[i].itemsPrice}.00\$",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Count : "),
                            SizedBox(width: 20),
                            Text(
                              " ${listDataModel[i].itemsCount}",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
