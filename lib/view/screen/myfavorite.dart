import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/widget/myfavorite/custom_list_favortie_items.dart';
// import 'package:e_commerce_app/core/middle_ware/myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    // MyfavoriteModel myfavoriteModel;
    Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(actions: [Center(child: Text("My Favorite Page"))]),
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
