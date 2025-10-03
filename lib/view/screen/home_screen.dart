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
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniCenterDocked,
        // floatingActionButton: FloatingActionButton(
        //   hoverElevation: 10,
        //   backgroundColor: Colors.blue,
        //   onPressed: () {},
        //   child: const Icon(Icons.shopping_cart, color: Colors.white),
        // ),
        bottomNavigationBar: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentPage,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (i) {
              controller.changePage(i);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_4_rounded),
                label: "profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
        ),

        body: controller.pages.elementAt(controller.currentPage),
      ),
    );
  }
}
