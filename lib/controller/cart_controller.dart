import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/cart_data.dart';
import 'package:get/get.dart';

abstract class ControllerInCart extends GetxController {
  // getData();
  addToCart(int itemsid);
  deleteFromCart(int itemsid);
  getCartCountItems(int itemsid);
  // cartView(int catId);
}

class ControllerInCartImp extends ControllerInCart {
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find<Crud>());
  late StatusRequest statusRequest;
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  List data = [];

  // @override
  // void onInit() {
  //   getData();
  //   super.onInit();
  // }

  // @override
  // getData() async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await cartData.cartView(usersid);
  //   statusRequest = handingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == "success") {
  //       List responseData = response['data'];
  //       data.addAll(responseData);
  //       // data.addAll(responseData.map((e) => MyfavoriteModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  addToCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addToCart(usersid, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("نبية", "تم اضافة المنتج");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  deleteFromCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteFromCart(usersid, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  getCartCountItems(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.cartCountItems(usersid, itemsid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        int countItems = 0;
        countItems = response['data'];
        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    //   @override
    //   cartView(catId) {
    //     cartData.cartView(catId);
    //     data.removeWhere((element) => element.favoriteId == catId);
    //     update();
    //   }
  }
}
