import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/order_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/archive_order_data.dart';
import 'package:get/get.dart';

abstract class OrderArchiveController extends GetxController {
  getViewOrder();
  printOrderStatus(int val);
  ordersRating(int orderId, double rating, String comment);
}

class OrderArchiveControllerImp extends OrderArchiveController {
  OrderArchive orderArchive = OrderArchive(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];
  OrdersModel? ordersModel;
  int? usersid;
  String? lang;

  @override
  void onInit() {
    usersid = myServices.sharedPreferences.getInt("id")!;
    lang = myServices.sharedPreferences.getString("lang");
    getViewOrder();

    super.onInit();
  }

  @override
  getViewOrder() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderArchive.viewOrders(usersid!);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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
  ordersRating(orderId, rating, comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderArchive.ordersRating(orderId, rating, comment);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        print("=============================$response");
        getViewOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
