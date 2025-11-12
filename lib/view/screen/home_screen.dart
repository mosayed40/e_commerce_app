import 'package:e_commerce_app/controller/home_screen_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentPage,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (i) {
              controller.changePage(i);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "cart".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "favorite".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "setting".tr,
              ),
            ],
          ),
        ),

        body: controller.pages.elementAt(controller.currentPage),
      ),
    );
  }
}
