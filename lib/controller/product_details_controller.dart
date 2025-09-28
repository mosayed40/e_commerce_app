import 'package:e_commerce_app/core/middle_ware/items_model.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addCount();
  removeCount();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  int number = 1;

  List data = [
    {"id": 1, "name": "black"},
    {"id": 2, "name": "red"},
    {"id": 3, "name": "grey"},
    {"id": 4, "name": "wight"},
  ];

  intialData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  addCount() {
    number++;

    update();
  }

  @override
  removeCount() {
    number--;
    update();
  }
}
