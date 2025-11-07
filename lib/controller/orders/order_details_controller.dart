import 'dart:async';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/middle_ware/order_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrderDetailsController extends GetxController {
  printOrderStatus(int val);
}

class OrderDetailsControllerImp extends OrderDetailsController {
  StatusRequest statusRequest = StatusRequest.loading;
  OrdersModel? ordersModel;
  Completer<GoogleMapController> controllerMap = Completer();
  CameraPosition? cameraPosition;
  double? lat;
  double? long;

  @override
  void onInit() {
    controllerMap = Completer<GoogleMapController>();
    initData();
    super.onInit();
  }

  initData() {
    ordersModel = Get.arguments['listModel'];
    lat = ordersModel!.addressLat;
    long = ordersModel!.addressLong;
    cameraPosition = CameraPosition(target: LatLng(lat!, long!), zoom: 14.4746);
    statusRequest = StatusRequest.none;
  }

  @override
  printOrderStatus(val) {
    if (val == 0) {
      return "pending approve";
    } else if (val == 1) {
      return "the order is being prepared ";
    } else if (val == 2) {
      return "on the way ";
    } else {
      return "archive ";
    }
  }
}
