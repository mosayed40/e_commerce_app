import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/myfavorite_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(id, val);
  getData();
  addFavorite(int itemsid);
  removeFavorite(int itemsid);
  deleteFromFavorite(int catId);
  goToCartPage();
}

class FavoriteControllerImp extends FavoriteController {
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find<Crud>());
  late StatusRequest statusRequest;
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  List<MyfavoriteModel> data = [];
  Map isFavorite = {};

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.favoriteView(usersid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyfavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  addFavorite(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(usersid, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  removeFavorite(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(usersid, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  deleteFromFavorite(catId) {
    favoriteData.favoriteDelete(catId);
    data.removeWhere((element) => element.favoriteId == catId);
    update();
  }

  @override
  goToCartPage() {
    Get.offNamed(AppRoute.shoppingCartPage);
  }
}
