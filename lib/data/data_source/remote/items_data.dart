import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(int id) async {
    var response = await crud.postData(AppLinkApi.items, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
