import 'package:e_commerce_app/view/screen/home.dart';
import 'package:e_commerce_app/view/screen/product_details.dart';
import 'package:e_commerce_app/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const ProductDetails(),
    const Center(child: Text("Profile Page")),
    const Setting(),
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
