import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/middle_ware/items_model.dart';
import 'package:e_commerce_app/data/data_source/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, int catVal);
  getItems(int selectedCat);
  statusFavorite(int i);
  goToPageProductDetails(ItemsModel itemsModel);
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
    var response = await itemsData.getData(selectedCat + 1);
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
    isFavorite != isFavorite;
    index = i;
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productDetails", arguments: {"itemsModel": itemsModel});
  }
}
