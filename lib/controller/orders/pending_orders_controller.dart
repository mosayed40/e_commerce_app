import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/order_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/orders_data.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  getPendingOrder();
  printOrderStatus(int val);
  goToOrderDetails(OrdersModel listModel);
  deleteOrder(int orderId);
}

class OrderControllerImp extends OrderController {
  OrdersData ordersData = OrdersData(Get.find<Crud>());
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];
  String? lang;

  OrdersModel? ordersModel;

  @override
  void onInit() {
    lang = myServices.sharedPreferences.getString("lang");
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
  goToOrderDetails(listModel) {
    Get.toNamed(AppRoute.orderDetails, arguments: {"listModel": listModel});
  }

  @override
  deleteOrder(orderId) async {
    var response = await ordersData.deleteOrders(orderId);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.ordersId == orderId);
        Get.snackbar("تنبية", "تم حذف الطلب");
      } else {
        Get.snackbar("تنبية", "لا يمكن حذف الطلب");
      }
    }
    update();
  }
}
