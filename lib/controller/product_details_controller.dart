import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addCount(int itemsId);
  removeCount(int itemsId);
  showCount();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  ControllerInCartImp controllerCart = Get.put(ControllerInCartImp());
  late ItemsModel itemsModel;
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
  }

  @override
  addCount(itemsId) {
    if (number < itemsModel.itemsCount!) {
      number++;
      return itemsModel.itemsPrice;
    } else {
      number = itemsModel.itemsCount!;
    }
    showCount();
    update();
  }

  @override
  removeCount(itemsId) {
    if (number > 1) {
      number--;
      itemsModel.itemsPrice = itemsModel.itemsPrice! - itemsModel.itemsPrice!;
      return itemsModel.itemsPrice;
    } else {
      number = number;
    }
    showCount();
    update();
  }

  @override
  showCount() {
    var countItem = itemsModel.itemsCount! - number;
    update();
    return countItem;
  }
}
