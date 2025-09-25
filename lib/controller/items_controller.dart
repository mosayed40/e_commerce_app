import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/data/data_source/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val);
  getItems(selectedCat);
  statusFavorite(int i);
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find<Crud>());
  late StatusRequest statusRequest;
  List data = [];

  List categories = [];
  int? selectedCat;
  bool isFavorite = false;
  int? index;

  @override
  void onInit() {
    intialData();
    getItems(selectedCat!);
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    getItems(selectedCat!);
  }

  @override
  changeCat(val) {
    selectedCat = val;
    update();
  }

  @override
  getItems(selectedCat) async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(selectedCat.toString());
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
  statusFavorite(i) {
    isFavorite = !isFavorite;
    index = i;
    update();
  }
}
