import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/middle_ware/cart_model.dart';
import 'package:e_commerce_app/core/middle_ware/coupon_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:e_commerce_app/data/data_source/remote/cart_data.dart';
import 'package:e_commerce_app/data/data_source/remote/orders_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckOutController extends GetxController {
  getShoppingAddress();
  choosePaymentMethod(String val);
  chooseAddressId(int val);
  checkCoupon(String coupon);
  getTotalPrice();
  checkOut();
}

class CartCheckOutControllerImp extends CheckOutController {
  CartData cartData = CartData(Get.find<Crud>());
  AddressData addressData = Get.put(AddressData(Get.find()));
  OrdersData ordersData = Get.put(OrdersData(Get.find()));
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  CartModel? cartModel;
  CouponModel? couponModel;
  TotalValueOfTheCardProductModel? totalValueModel;
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  late TextEditingController couponCode;
  int? couponId;
  double? priceOrder;
  int? addressId;
  int? descountCoupon;
  int deliveryPrice = 50;
  double? orderPrice;
  String? couponName;
  String? paymentMethod;
  List<AddressModel> data = [];

  @override
  void onInit() {
    intialData();
    getShoppingAddress();
    super.onInit();
  }

  intialData() {
    couponCode = TextEditingController();
    cartModel = Get.arguments['cartModel'];
    totalValueModel = Get.arguments['totalValueModel'];
    couponModel = CouponModel();
    priceOrder = cartModel!.askPrice ?? 0.0;
    couponId = couponModel!.couponId ?? 0;
    orderPrice = totalValueModel!.totalprice ?? 0.0;
    descountCoupon = descountCoupon ?? 0;
  }

  @override
  chooseAddressId(val) {
    addressId = val;
    update();
  }

  @override
  choosePaymentMethod(val) {
    paymentMethod = val;
    update();
  }

  @override
  getShoppingAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddress(usersid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.clear();
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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
        descountCoupon = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId;
      } else {
        descountCoupon = 0;
        couponName = null;
        Get.snackbar(
          "خطأ",
          "الكوبون الذي تم ادخالة غير صالح",
          backgroundColor: Color(0xDDDB3F37),
          duration: const Duration(seconds: 1),
        );
      }
    }
    update();
  }

  @override
  getTotalPrice() {
    return (orderPrice! - orderPrice! * descountCoupon! / 100) + deliveryPrice;
  }

  @override
  checkOut() async {
    if (paymentMethod == null) {
      return Get.snackbar("خطأ", "null لا يمكن ان يكون paymentMethod");
    }
    if (addressId == null) {
      return Get.snackbar("خطأ", "null لا يمكن ان يكون addressId");
    }
    if (couponId == null) {
      return Get.snackbar("خطأ", "null لا يمكن ان يكون couponId");
    }
    if (descountCoupon == null) {
      return Get.snackbar("خطأ", "null لا يمكن ان يكون descountCoupon");
    }
    if (orderPrice == null) {
      return Get.snackbar("خطأ", "null لا يمكن ان يكون totalPrice");
    }

    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.checkOutOrders(
      usersid,
      addressId!,
      deliveryPrice,
      couponId!,
      descountCoupon!,
      orderPrice!,
      paymentMethod!,
    );
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        Get.snackbar(
          "تنبة",
          "تم تأكيد الطلب نجاح",
          backgroundColor: Color(0xCD21F38E),
          duration: const Duration(seconds: 2),
        );
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar(
          "خطأ",
          "لا يمكن تأكيد الطلب الان حاول في وقت لاحق",
          backgroundColor: Color(0xFFF32C21),
        );
      }
    }
    update();
  }
}
