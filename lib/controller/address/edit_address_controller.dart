// import 'package:e_commerce_app/core/class/c_r_u_d.dart';
// import 'package:e_commerce_app/core/class/status_request.dart';
// import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
// import 'package:e_commerce_app/core/middle_ware/address_model.dart';
// import 'package:e_commerce_app/core/services/services.dart';
// import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class ControllerEditAddress extends GetxController {
//   editAddress();
// }

// class ControllerEditAddressImp extends ControllerEditAddress {
//   GlobalKey<FormState> editAddressFormState = GlobalKey<FormState>();

//   AddressData addressData = AddressData(Get.find<Crud>());
//   MyServices myServices = Get.find();
//   StatusRequest statusRequest = StatusRequest.none;
//   AddressModel? addressModel;
//   late int usersid = myServices.sharedPreferences.getInt("id")!;
//   late TextEditingController name;
//   late TextEditingController phone;
//   late TextEditingController city;
//   late TextEditingController street;
//   int? addressid;
//   double? lat;
//   double? long;

//   @override
//   void onInit() {
//     addressModel = Get.arguments['addressModel'];

//     name = TextEditingController(text: addressModel?.addressName ?? "");
//     phone = TextEditingController(text: addressModel?.addressPhone ?? "");
//     city = TextEditingController(text: addressModel?.addressCity ?? "");
//     street = TextEditingController(text: addressModel?.addressStreet ?? "");
//     addressid = int.tryParse(addressModel?.addressId ?? "0");
//     lat = double.tryParse(addressModel?.addressLat ?? "0");
//     long = double.tryParse(addressModel?.addressLong ?? "0");
//     super.onInit();
//   }

//   @override
//   editAddress() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await addressData.editAddress(
//       addressid.toString(),
//       name.text,
//       phone.text,
//       city.text,
//       street.text,
//       lat.toString(),
//       long.toString(),
//     );
//     statusRequest = handingData(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         Get.snackbar(
//           "نبية",
//           "تم تعديل العنوان",
//           backgroundColor: Color(0xFF3199EE),
//           duration: const Duration(seconds: 1),
//         );
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   void onClose() {
//     name.dispose();
//     phone.dispose();
//     city.dispose();
//     street.dispose();
//     super.onClose();
//   }

// }

import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerEditAddress extends GetxController {
  editAddress();
}

class ControllerEditAddressImp extends ControllerEditAddress {
  GlobalKey<FormState> editAddressFormState = GlobalKey<FormState>();

  AddressData addressData = AddressData(Get.find<Crud>());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
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
    name = TextEditingController();
    phone = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    intiaData();
    super.onInit();
  }

  intiaData() {
    addressModel = Get.arguments['addressModel'];
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    if (addressModel != null) {
      addressid = addressModel!.addressId;
      phone.text = addressModel!.addressPhone.toString();
      name.text = addressModel!.addressName ?? '';
      city.text = addressModel!.addressCity ?? '';
      street.text = addressModel!.addressStreet ?? '';
    }
  }

  @override
  editAddress() async {
    var formData = editAddressFormState.currentState;
    if (formData != null && formData.validate()) {
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
            "تنبيه",
            "تم تعديل العنوان بنجاح ✅",
            backgroundColor: const Color(0xFF3199EE),
            duration: const Duration(seconds: 1),
          );
          Get.offNamed(AppRoute.setting);
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
