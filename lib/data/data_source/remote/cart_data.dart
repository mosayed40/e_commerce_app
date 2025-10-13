import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addToCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLinkApi.addToCart, {
      "users_id": usersid.toString(),
      "items_id": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFromCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLinkApi.deleteFromCart, {
      "users_id": usersid.toString(),
      "items_id": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  countItemsCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLinkApi.countItemsCart, {
      "users_id": usersid.toString(),
      "items_id": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCartData(int usersid) async {
    var response = await crud.postData(AppLinkApi.cartView, {
      "users_id": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
