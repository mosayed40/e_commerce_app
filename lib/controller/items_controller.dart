import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, int catVal);
  getItems(int selectedCat);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find<Crud>());
  late StatusRequest statusRequest;
  List data = [];
  List categories = [];
  int? selectedCat;
  int? usersid;

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
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
    Get.toNamed("productDetails", arguments: {"itemsModel": itemsModel});
  }
}
