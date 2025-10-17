import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerInAddress extends GetxController {
  getViewAddressData();
  addAddress();
  editAddress();
  deleteAddress(int addressid);
}

class ControllerInAddressImp extends ControllerInAddress {
  GlobalKey<FormState> addressFormState = GlobalKey<FormState>();
  AddressData addressData = AddressData(Get.find<Crud>());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> data = [];
  AddressModel? addressModel;
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  late TextEditingController addressid;
  late TextEditingController phone;
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController lat;
  late TextEditingController long;

  @override
  void onInit() {
    addressid = TextEditingController();
    phone = TextEditingController();
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = TextEditingController();
    long = TextEditingController();
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
  addAddress() async {
    var formData = addressFormState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addAddress(
        usersid,
        phone.text,
        name.text,
        city.text,
        street.text,
        lat.text,
        long.text,
      );
      statusRequest = handingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.snackbar(
            "نبية",
            "تم اضافة العنوان",
            backgroundColor: Color(0xFF3199EE),
          );
          getViewAddressData();
          Get.offAllNamed(AppRoute.viewAddress);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  editAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.editAddress(
      addressid.text,
      phone.text,
      name.text,
      city.text,
      street.text,
      lat.text,
      long.text,
    );
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم تعديل العنوان",
          backgroundColor: Color(0xFF3199EE),
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
    print("🧾 deleteAddress Response: $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نبية",
          "تم حذف العنوان",
          backgroundColor: Color(0xFFF04628),
        );
        getViewAddressData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onClose() {
    phone.dispose();
    name.dispose();
    city.dispose();
    street.dispose();
    lat.dispose();
    long.dispose();
    super.onClose();
  }
}
