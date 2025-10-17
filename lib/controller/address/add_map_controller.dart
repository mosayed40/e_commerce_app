import 'dart:async';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:e_commerce_app/core/class/status_request.dart';

abstract class ControllerMap extends GetxController {
  addMarkers(LatLng latLng);
  getCurrentLocation();
  goToAddAddressDataPage();
}

class ControllerMapImp extends ControllerMap {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController> controllerMap = Completer();
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  Position? position;
  double? lat;
  double? long;

  @override
  void onInit() {
    controllerMap = Completer<GoogleMapController>();
    getCurrentLocation();
    super.onInit();
  }

  @override
  addMarkers(latLng) {
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
  goToAddAddressDataPage() {
    Get.toNamed(AppRoute.addAddress, arguments: {"lat": lat, "long": long});
  }
}
