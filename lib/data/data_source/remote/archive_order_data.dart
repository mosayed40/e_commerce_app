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

  ordersRating(int ordersId, double rating, String comment) async {
    var response = await crud.postData(AppLinkApi.ordersRating, {
      "id": ordersId.toString(),
      "rating": rating.toString(),
      "comment": comment.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
