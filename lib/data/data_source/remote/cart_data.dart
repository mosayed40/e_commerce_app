import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addToCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLinkApi.cartAdd, {
      "users_id": usersid.toString(),
      "items_id": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFromCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLinkApi.cartdelete, {
      "users_id": usersid.toString(),
      "items_id": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  // cartCountItems(int usersid, int itemsid) async {
  //   var response = await crud.postData(AppLinkApi.cartCountItems, {
  //     "users_id": usersid.toString(),
  //     "items_id": itemsid.toString(),
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  cartView(int id) async {
    var response = await crud.postData(AppLinkApi.cartView, {
      "id": id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
