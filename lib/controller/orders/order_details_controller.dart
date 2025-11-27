import 'dart:async';
import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/data/data_source/remote/orders_data.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/middle_ware/order_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrderDetailsController extends GetxController {
  printOrderStatus(int val);
  getOrderDetailsData();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  OrdersData ordersData = OrdersData(Get.find<Crud>());

  StatusRequest statusRequest = StatusRequest.loading;
  OrdersModel? ordersModel;
  Completer<GoogleMapController> controllerMap = Completer();
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  double? lat;
  double? long;
  int? orderId;
  List data = [];

  @override
  void onInit() {
    ordersModel = Get.arguments['listModel'];
    initData();
    getOrderDetailsData();
    super.onInit();
  }

  initData() {
    orderId = ordersModel!.ordersId;
    lat = ordersModel!.addressLat;
    long = ordersModel!.addressLong;
    markers.add(
      Marker(markerId: MarkerId("${orderId!}"), position: LatLng(lat!, long!)),
    );
    cameraPosition = CameraPosition(target: LatLng(lat!, long!), zoom: 11.4746);
    statusRequest = StatusRequest.none;
  }

  @override
  printOrderStatus(val) {
    if (val == 0) {
      return "statusOrder0".tr;
    } else if (val == 1) {
      return "statusOrder1".tr;
    } else if (val == 2) {
      return "statusOrder2".tr;
    } else {
      return "statusOrder3".tr;
    }
  }

  @override
  getOrderDetailsData() async {
    var response = await ordersData.orderDetails(orderId!);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
