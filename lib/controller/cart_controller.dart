import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/cart_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerInCart extends GetxController {
  getViewCartData();
  addToCart(int itemsid);
  deleteFromCart(int itemsid);
  getCountItemsCart(int itemsid);
  refresData();

  goToCheckOut();
}

class ControllerInCartImp extends ControllerInCart {
  CartData cartData = CartData(Get.find<Crud>());
  MyServices myServices = Get.find();
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  StatusRequest statusRequest = StatusRequest.loading;
  CartModel? cartModel;
  TotalValueOfTheCardProductModel? totalValueModel;
  double totalPrice = 0.0;
  List<CartModel> data = [];
  Map totalValue = {};

  @override
  void onInit() {
    getViewCartData();
    cartModel = CartModel();
    super.onInit();
  }

  @override
  getViewCartData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCartData(usersid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['data']['status'] == "success") {
          List responseData = response['data']['data'];
          Map<String, dynamic> responseTotalValue = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalValueModel = TotalValueOfTheCardProductModel.fromJson(
            responseTotalValue,
          );
          totalPrice = totalValueModel!.totalprice!;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addToCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addToCart(usersid, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم اضافة المنتج",
          backgroundColor: Color(0xFF3199EE),
          duration: const Duration(seconds: 1),
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
    var response = await cartData.deleteFromCart(usersid, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم حذف المنتج",
          backgroundColor: Color(0xFFD53939),
          duration: const Duration(seconds: 1),
        );
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getCountItemsCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.countItemsCart(usersid, itemsid);
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

  @override
  refresData() {
    data.clear();
    getViewCartData();
    update();
  }

  @override
  goToCheckOut() {
    if (data.isEmpty) return Get.snackbar("تنبية", "السلة فارغة");
    Get.toNamed(
      AppRoute.cartProductsDetails,
      arguments: {"cartModel": cartModel, "totalValueModel": totalValueModel},
    );
  }
}
