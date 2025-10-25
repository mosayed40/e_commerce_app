import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/view/widget/myfavorite/custom_list_favortie_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        actions: [
          SizedBox(width: 25),
          CustomIconBack(),
          Spacer(),
          Container(
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Favorite",
              style: TextStyle(fontSize: 30, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<FavoriteControllerImp>(
          builder: (controller) => ListView(
            children: [
              HandlingDatatView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return CustomListFavoriteItems(
                      favoriteModel: controller.data[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
