import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addCount();
  removeCount();
  showCount();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  late int quantity;
  late int price;
  int number = 1;

  List data = [
    {"id": 1, "name": "black", "color": 0xFF000000},
    {"id": 2, "name": "red", "color": 0xFFFD1414},
    {"id": 3, "name": "white", "color": 0xFFFFFFFF},
    {"id": 4, "name": "grey", "color": 0xFF9E9E9E},
  ];

  @override
  void onInit() {
    intilData();
    super.onInit();
  }

  intilData() {
    itemsModel = Get.arguments['itemsModel'];
    quantity = itemsModel.itemsCount!;
    price = itemsModel.itemsPrice!;
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
