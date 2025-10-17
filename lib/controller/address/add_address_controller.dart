import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerAddAddress extends GetxController {
  addAddress();
}

class ControllerAddAddressImp extends ControllerAddAddress {
  GlobalKey<FormState> addressFormState = GlobalKey<FormState>();
  AddressData addressData = AddressData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late int usersid = myServices.sharedPreferences.getInt("id")!;
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
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  @override
  addAddress() async {
    var formData = addressFormState.currentState;
    if (formData!.validate()) {
      if (lat == null || long == null) {
        Get.snackbar(
          "تنبيه",
          "الرجاء تحديد الموقع قبل إضافة العنوان",
          duration: const Duration(seconds: 1),
        );
        return;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addAddress(
        usersid,
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
            "تم اضافة العنوان",
            duration: const Duration(seconds: 1),
            backgroundColor: Color(0xFF3199EE),
          );
          Get.offAllNamed(AppRoute.viewAddress);
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
