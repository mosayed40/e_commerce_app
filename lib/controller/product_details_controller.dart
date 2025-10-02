import 'package:e_commerce_app/core/middle_ware/items_model.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addCount();
  removeCount();
  showCount();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  int number = 1;
  late int quantity;
  late int price;

  List data = [
    {"id": 1, "name": "black"},
    {"id": 2, "name": "red"},
    {"id": 3, "name": "grey"},
    {"id": 4, "name": "white"},
  ];

  intialData() {
    itemsModel = Get.arguments['itemsModel'];
    quantity = itemsModel.itemsCount!;
    price = itemsModel.itemsPrice!;
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  addCount() {
    if (number < itemsModel.itemsCount!) {
      return itemsModel.itemsPrice;
    } else {
      number = itemsModel.itemsCount!;
    }
    showCount();
    update();
  }

  @override
  removeCount() {
    if (number > 1) {
      number--;
      itemsModel.itemsPrice = itemsModel.itemsPrice! - price;
      return itemsModel.itemsPrice;
    } else {
      number = number;
    }
    showCount();
    update();
  }

  @override
  showCount() {
    itemsModel.itemsCount = quantity - (number);
    return itemsModel.itemsCount;
  }
}
