import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/link_api.dart';
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
    FavoriteControllerImp controllerFavorite = Get.put(FavoriteControllerImp());
    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actionsPadding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            actions: [
              CustomIconBack(),
              SizedBox(width: 20),
              Expanded(
                flex: 4,

                child: CustomSearchTextFormField(
                  myController: controller.search!,
                  hintText: "Search For Products",
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressedSearch: () {
                    controller.onSearch();
                  },
                ),
              ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.all(15),
            children: [
              const SizedBox(height: 20),
              const CustomListCategoriesItemsPage(),
              GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDatatView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch
                      ? ListItemsSearch(listDataModel: controller.listData)
                      : GridView.builder(
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
                              itemsModel: ItemsModel.fromJson(
                                controller.data[index],
                              ),
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
            controller.goToPageProductDetails(listDataModel[i]);
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
                        width: 20,
                        height: 100,
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
