import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/data/data_source/remote/offers_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OffersController extends GetxController {
  getData();
  checkSearch(val);
  onSearch();
  searchData();
}

class OffersControllerImp extends OffersController {
  OffersData offersData = OffersData(Get.find<Crud>());
  late StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> data = [];
  TextEditingController? search;
  bool isSearch = false;

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  @override
  onSearch() {
    if (search!.text != "") {
      isSearch = true;
    }
    searchData();
    update();
  }

  @override
  searchData() async {
    var response = await offersData.searchData(search!.text);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.clear();
        List responseData = response['data'];
        data.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
