import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/view/screen/shopping_cart.dart';
import 'package:e_commerce_app/view/screen/favorite.dart';
import 'package:e_commerce_app/view/screen/home.dart';
import 'package:e_commerce_app/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  ControllerInCartImp cartController = Get.put(ControllerInCartImp());
  StatusRequest statusRequest = StatusRequest.loading;
  int currentPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const ShoppingCartPage(),
    const MyFavorite(),
    const Setting(),
  ];

  @override
  changePage(int index) {
    currentPage = index;
    if (index == 1) {
      cartController.onInit();
    }
    statusRequest = StatusRequest.none;
    update();
  }
}
