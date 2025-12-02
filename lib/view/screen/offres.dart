import 'package:e_commerce_app/controller/offers_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/view/screen/home.dart';
import 'package:e_commerce_app/view/widget/offers/custom_search_app_bar.dart';
import 'package:e_commerce_app/view/widget/offers/custom_list_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offres extends StatelessWidget {
  const Offres({super.key});

  @override
  Widget build(BuildContext context) {
    OffersControllerImp controllerImp = Get.put(OffersControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        title: Column(
          children: [
            Row(
              children: [
                CustomIconBack(),
                Expanded(
                  flex: 4,
                  child: CustomTitlePage(title: "titlePageOffers"),
                ),
              ],
            ),
            CustomSearchAppBar(
              titleAppBar: "search",
              myController: controllerImp.search!,
              onChanged: (val) {
                controllerImp.checkSearch(val);
              },
              onPressedSearch: () {
                controllerImp.onSearch();
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<OffersControllerImp>(
          builder: (controller) => controller.isSearch
              ? ListItemsSearch(listDataModel: controller.data)
              : HandlingDatatView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 0.9,
                            ),
                        itemBuilder: (context, index) {
                          return CustomListOffers(
                            listModel: controller.data[index],
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
