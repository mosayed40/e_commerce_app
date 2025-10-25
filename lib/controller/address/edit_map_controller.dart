import 'dart:async';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:e_commerce_app/core/class/status_request.dart';

abstract class EditMapController extends GetxController {
  editMarkers(LatLng latLng);
  getCurrentLocation();
  goToEditAddressDataPage();
}

class EditMapControllerImp extends EditMapController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController> controllerMap = Completer();
  AddressModel? addressModel;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  Position? position;
  double? lat;
  double? long;

  @override
  void onInit() {
    intiaData();
    getCurrentLocation();
    super.onInit();
  }

  intiaData() {
    controllerMap = Completer<GoogleMapController>();
    addressModel = Get.arguments['addressModel'];

    lat = addressModel!.addressLat;
    long = addressModel!.addressLong;
  }

  @override
  editMarkers(latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  goToEditAddressDataPage() {
    if (lat == null || long == null) {
      Get.snackbar(
        "تنبيه",
        "الرجاء تعديل الموقع قبل تعديل العنوان",
        duration: const Duration(seconds: 1),
        backgroundColor: const Color(0x88F2524D),
      );
      return;
    }
    Get.toNamed(
      AppRoute.editAddress,
      arguments: {"addressModel": addressModel, "lat": lat, "long": long},
    );
  }
}
