import 'dart:async';

import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ControllerViewAddress extends GetxController {
  setInitialMarker(double latl, double longl);
  getViewAddressData();
  deleteAddress(int addressid);
  goToEditAddress();
}

class ControllerViewAddressImp extends ControllerViewAddress {
  AddressData addressData = AddressData(Get.find<Crud>());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  List<AddressModel> data = [];
  AddressModel? addressModel;
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  Completer<GoogleMapController> controllerMap = Completer();
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  double? lat;
  double? long;

  @override
  void onInit() {
    // controllerMap = Completer<GoogleMapController>();
    getViewAddressData();

    update();
    super.onInit();
  }

  @override
  setInitialMarker(lat, long) async {
    markers.add(
      Marker(markerId: const MarkerId("1"), position: LatLng(lat, long)),
    );
    cameraPosition = CameraPosition(target: LatLng(lat, long), zoom: 14.4746);
    if (controllerMap.isCompleted) {
      final GoogleMapController mapController = await controllerMap.future;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, long), zoom: 14.4746),
        ),
      );
    }
    update();
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
        addressModel = AddressModel();

        print("=============$addressModel");
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
        // Get.offNamed(AppRoute.viewAddress);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToEditAddress() {
    Get.toNamed(
      AppRoute.editMapDemo,
      arguments: {"addressModel": addressModel},
    );
  }
}
