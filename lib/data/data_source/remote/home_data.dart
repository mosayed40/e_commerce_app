import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinkApi.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLinkApi.searchItems, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
