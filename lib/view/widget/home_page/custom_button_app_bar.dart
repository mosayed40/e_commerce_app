import 'package:e_commerce_app/controller/home_screen_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
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
            icon: Icon(Icons.production_quantity_limits),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
