import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:get/get.dart';

abstract class CheckOutController extends GetxController {
  getShoppingAddress();
  choosePaymentMethod(String val);
  chooseAddressId(String val);
}

class CartCheckOutControllerImp extends CheckOutController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  MyServices myServices = Get.find();
  late int usersid = myServices.sharedPreferences.getInt("id")!;
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> data = [];
  String? paymentMethod;
  String? addressId;

  @override
  void onInit() {
    getShoppingAddress();
    super.onInit();
  }

  @override
  chooseAddressId(val) {
    addressId = val;
    update();
  }

  @override
  choosePaymentMethod(val) {
    paymentMethod = val;
    update();
  }

  @override
  getShoppingAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddress(usersid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        // data.clear();
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        print(responseData);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
