import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int i);
  goToMyfavorite();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find<Crud>());
  // List data = [];
  List categoriesList = [];
  List itemsList = [];

  late StatusRequest statusRequest;
  String? username;
  int? id;
  String? lang;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
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
        print("====response is null or status != success====");
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
    Get.toNamed(AppRoute.myFavorite);
  }
}
