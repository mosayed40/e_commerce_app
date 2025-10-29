import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/pending_order_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/orders_data.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  getPendingOrder();
  printOrderStatus(int val);
}

class OrderControllerImp extends OrderController {
  OrdersData ordersData = OrdersData(Get.find<Crud>());
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];

  @override
  void onInit() {
    getPendingOrder();
    super.onInit();
  }

  @override
  getPendingOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.pendingOrders(usersid);
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
