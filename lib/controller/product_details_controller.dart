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
  late int price = itemsModel.itemsPrice!;
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
      number++;
      itemsModel.itemsPrice = number * price;
    } else {
      // Get.snackbar(
      //   "خطأ",
      //   "لا يمكن أن يكون العدد اكبر من ${itemsModel.itemsCount}",
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: const Color(0xFFFB4B3E),
      //   colorText: const Color(0xFF000000),
      // );
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
      // Get.snackbar(
      //   "خطأ",
      //   "لا يمكن أن يكون العدد اقل من 1",
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: const Color(0xFFFB4B3E),
      //   colorText: const Color(0xFF000000),
      // );
      number = number;
    }
    showCount();
    update();
  }

  @override
  showCount() {
    itemsModel.itemsCount = quantity - number;
    return itemsModel.itemsCount;
  }
}
