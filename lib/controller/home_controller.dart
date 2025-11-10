import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int i);
  goToMyfavorite();
  goToPageItemDetails(ItemsModel itemsModel);
  checkSearch(val);
  onSearch();
  searchData();
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find<Crud>());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List categoriesList = [];
  List itemsList = [];
  List<ItemsModel> listData = [];
  TextEditingController? search;
  String? username;
  String? lang;
  int? id;
  bool isSearch = false;

  @override
  void onInit() {
    getData();
    initialData();
    update();
    super.onInit();
  }

  @override
  initialData() {
    search = TextEditingController();
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response != null && response['status'] == "success") {
        var categoriesResponse = response['categories'];
        var itemsResponse = response['items'];
        if (categoriesResponse != null &&
            categoriesResponse['status'] == "success") {
          categoriesList.clear();
          categoriesList.addAll(categoriesResponse['data']);
        }
        if (itemsResponse != null && itemsResponse['status'] == "success") {
          itemsList.clear();
          itemsList.addAll(itemsResponse['data']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, i) {
    Get.toNamed(
      AppRoute.items,
      arguments: {"categories": categories, "selectedCat": i},
    );
  }

  @override
  goToMyfavorite() {
    // Get.toNamed(AppRoute.myFavorite);
  }

  @override
  goToPageItemDetails(itemsModel) {
    Get.toNamed(AppRoute.itemDetails, arguments: {"itemsModel": itemsModel});
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
