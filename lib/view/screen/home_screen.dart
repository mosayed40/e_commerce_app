import 'package:e_commerce_app/controller/home_screen_controller.dart';
import 'package:e_commerce_app/view/widget/home_page/custom_button_app_bar.dart';
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
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          hoverElevation: 10,
          backgroundColor: Colors.blue,
          onPressed: () {},
          child: const Icon(Icons.shopping_cart, color: Colors.white),
        ),
        bottomNavigationBar: const CustomButtonAppBarHome(),
        body: controller.pages.elementAt(controller.currentPage),
      ),
    );
  }
}
