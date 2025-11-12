import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/view/widget/favorite/custom_list_favortie_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [
          Expanded(flex: 4, child: CustomTitlePage(title: "titlePageFavorit")),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<FavoriteControllerImp>(
          builder: (controller) => HandlingDatatView(
            statusRequest: controller.statusRequest,
            widget: controller.data.isEmpty
                ? Center(child: Text("No Dtat"))
                : ListView(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                            ),
                        itemBuilder: (context, index) {
                          return CustomListFavoriteItems(
                            favoriteModel: controller.data[index],
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
