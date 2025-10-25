import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/cart_model.dart';
import 'package:e_commerce_app/core/middle_ware/coupon_model.dart';
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
  checkCoupon(String coupon);
  getTotalPrice();
}

class ControllerInCartImp extends ControllerInCart {
  CartData cartData = CartData(Get.find<Crud>());
  MyServices myServices = Get.find();
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  late TextEditingController couponCode;
  late StatusRequest statusRequest;
  late CartModel cartModel;
  late CouponModel couponModel;
  int descountCoupon = 0;
  double totalPrice = 1225;
  String? couponName;
  List<CartModel> data = [];

  @override
  void onInit() {
    couponCode = TextEditingController();
    getViewCartData();
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
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
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
    update();
    var response = await cartData.deleteFromCart(usersid, itemsid);
    statusRequest = handingData(response);
    // print("🧾 deleteFromCart Response: $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم حذف المنتج",
          backgroundColor: Color(0xFFD53939),
          duration: const Duration(seconds: 1),
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
  }

  @override
  checkCoupon(coupon) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(coupon);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        descountCoupon = couponModel.couponDiscount!;
        couponName = couponModel.couponName;
        Get.snackbar(
          "نبية",
          "تم اضافة الكوبون",
          backgroundColor: Color(0xFF31EED8),
          duration: const Duration(seconds: 1),
        );
      } else {
        descountCoupon = 0;
        couponName = null;
      }
    }
    update();
  }

  @override
  getTotalPrice() {
    return (totalPrice - totalPrice * descountCoupon / 100);
  }
}
