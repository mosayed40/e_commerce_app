import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
// import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerInAddress extends GetxController {
  getViewAddressData();
  // addAddress();
  editAddress();
  deleteAddress(int addressid);
}

class ControllerInAddressImp extends ControllerInAddress {
  // GlobalKey<FormState> addressFormState = GlobalKey<FormState>();
  AddressData addressData = AddressData(Get.find<Crud>());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> data = [];
  AddressModel? addressModel;
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController city;
  late TextEditingController street;
  int? addressid;
  double? lat;
  double? long;

  @override
  void onInit() {
    getViewAddressData();
    name = TextEditingController();
    phone = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
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
        // print("🧾 getViewAddressData Response: $response");
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
  editAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.editAddress(
      addressid.toString(),
      name.text,
      phone.text,
      city.text,
      street.text,
      lat.toString(),
      long.toString(),
    );
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم تعديل العنوان",
          backgroundColor: Color(0xFF3199EE),
          duration: const Duration(seconds: 1),
        );
        getViewAddressData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteAddress(addressid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.deleteAddress(addressid);
    statusRequest = handingData(response);
    // print("🧾 deleteAddress Response: $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم حذف العنوان",
          backgroundColor: Color(0xFFF04628),
          duration: const Duration(seconds: 1),
        );
        Get.offNamed(AppRoute.viewAddress);
        getViewAddressData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onClose() {
    name.dispose();
    phone.dispose();
    city.dispose();
    street.dispose();
    super.onClose();
  }
}
