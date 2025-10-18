import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerViewAddress extends GetxController {
  getViewAddressData();
  deleteAddress(int addressid);
}

class ControllerViewAddressImp extends ControllerViewAddress {
  AddressData addressData = AddressData(Get.find<Crud>());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> data = [];
  AddressModel? addressModel;
  late int usersid = myServices.sharedPreferences.getInt("id")!;

  @override
  void onInit() {
    addressModel = AddressModel();
    getViewAddressData();
    super.onInit();
  }

  @override
  getViewAddressData() async {
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
  deleteAddress(addressid) async {
    var response = await addressData.deleteAddress(addressid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم حذف العنوان",
          backgroundColor: Color(0xFFF04628),
          duration: const Duration(seconds: 1),
        );
        Get.offAllNamed(AppRoute.viewAddress);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
