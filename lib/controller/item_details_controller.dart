import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {
  addCount();
  removeCount();
  addToCart(int itemsid);
  deleteFromCart(int itemsid);
  getCountItemsCart(int iremsid);
}

class ItemDetailsControllerImp extends ItemDetailsController {
  CartData cartData = CartData(Get.find<Crud>());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  ItemsModel? itemsModel;
  int? usersid;
  int countItems = 0;

  List data = [
    {"id": 1, "name": "black", "color": 0xFF000000},
    // {"id": 2, "name": "red", "color": 0xFFFD1414},
    {"id": 3, "name": "white", "color": 0xFFFFFFFF},
    {"id": 4, "name": "grey", "color": 0xFF9E9E9E},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() async {
    statusRequest = StatusRequest.loading;
    update();
    itemsModel = Get.arguments['itemsModel'];
    usersid = myServices.sharedPreferences.getInt("id");

    if (itemsModel != null && usersid != null) {
      countItems = await getCountItemsCart(itemsModel!.itemsId!);
    }
    // countItems = await getCountItemsCart(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addCount() {
    if (countItems < itemsModel!.itemsCount!) {
      countItems++;
      addToCart(itemsModel!.itemsId!);
    } else {
      return itemsModel!.itemsCount;
    }
    update();
  }

  @override
  removeCount() {
    if (countItems > 1) {
      countItems--;
      deleteFromCart(itemsModel!.itemsId!);
    } else {
      countItems = countItems;
    }
    update();
  }

  @override
  addToCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addToCart(usersid!, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم اضافة المنتج",
          backgroundColor: Color(0xFF3199EE),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteFromCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteFromCart(usersid!, itemsid);
    statusRequest = handingData(response);
    // print("🧾 deleteFromCart Response: $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم حذف المنتج",
          backgroundColor: Color(0xFF3199EE),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getCountItemsCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.countItemsCart(usersid!, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        int countItems = 0;
        countItems = response['data'];
        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
