import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/home_data.dart';
import 'package:e_commerce_app/data/data_source/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, int catVal);
  getItems(int selectedCat);
  goToPageProductDetails(ItemsModel itemsModel);
  checkSearch(val);
  onSearch();
  searchData();
}

class ItemsControllerImp extends ItemsController {
  HomeData homeData = HomeData(Get.find<Crud>());
  ItemsData itemsData = ItemsData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List categories = [];
  List data = [];
  int? selectedCat;
  int? usersid;

  List<ItemsModel> listData = [];
  TextEditingController? search;
  bool isSearch = false;

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    search = TextEditingController();
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    usersid = myServices.sharedPreferences.getInt("id");
    getItems(selectedCat!);
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    selectedCat = catVal - 1;
    getItems(selectedCat!);
    update();
  }

  @override
  getItems(selectedCat) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(selectedCat + 1, usersid!);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  @override
  onSearch() {
    if (search!.text != "") {
      isSearch = true;
    } else {
      isSearch = false;
    }
    searchData();
    update();
  }

  @override
  searchData() async {
    var response = await homeData.searchData(search!.text);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
