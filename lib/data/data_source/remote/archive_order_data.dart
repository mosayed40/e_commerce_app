import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class OrderArchive {
  Crud crud;
  OrderArchive(this.crud);

  viewOrders(int usersid) async {
    var response = await crud.postData(AppLinkApi.archive, {
      "user_id": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
