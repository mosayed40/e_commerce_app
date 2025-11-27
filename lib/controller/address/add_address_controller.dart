import 'dart:async';

import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ControllerAddAddress extends GetxController {
  addAddress();
}

class ControllerAddAddressImp extends ControllerAddAddress {
  GlobalKey<FormState> addAddressFormState = GlobalKey<FormState>();
  AddressData addressData = AddressData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  Completer<GoogleMapController> controllerMap = Completer();
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController city;
  late TextEditingController street;
  double? lat;
  double? long;

  @override
  void onInit() {
    name = TextEditingController();
    phone = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    intiaData();
    super.onInit();
  }

  intiaData() {
    controllerMap = Completer<GoogleMapController>();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  @override
  addAddress() async {
    var formData = addAddressFormState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addAddress(
        usersid.toString(),
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
          Get.offAllNamed(AppRoute.home);
          Get.snackbar(
            "نبية",
            "تم اضافة العنوان",
            duration: const Duration(seconds: 1),
            backgroundColor: Color(0xFF3199EE),
          );
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
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
