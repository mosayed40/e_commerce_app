import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addCount();
  removeCount();
  showCount();
  showPrice();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  ControllerInCartImp cartController = Get.put(ControllerInCartImp());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countItems = 0;

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

  intilData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    countItems = await cartController.getCartCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addCount() {
    if (countItems < itemsModel.itemsCount!) {
      countItems++;
    } else {
      return itemsModel.itemsCount;
    }
    update();
  }

  @override
  removeCount() {
    if (countItems > 1) {
      countItems--;
    } else {
      countItems = countItems;
    }
    update();
  }

  @override
  showCount() {
    itemsModel.itemsCount = itemsModel.itemsCount! - countItems;
    return itemsModel.itemsCount;
  }

  @override
  showPrice() {
    itemsModel.itemsPrice = itemsModel.itemsPrice! * countItems;
    update();
    return itemsModel.itemsPrice;
  }
}
