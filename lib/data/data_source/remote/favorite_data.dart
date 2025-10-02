import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(int usersid, int itemsid) async {
    var response = await crud.postData(AppLinkApi.favoriteAdd, {
      "users_id": usersid.toString(),
      "items_id": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int usersid, int itemsid) async {
    var response = await crud.postData(AppLinkApi.favoriteRemove, {
      "users_id": usersid.toString(),
      "items_id": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  favoriteView(int id) async {
    var response = await crud.postData(AppLinkApi.favoriteView, {
      "id": id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  favoriteDelete(int id) async {
    var response = await crud.postData(AppLinkApi.favoriteDelete, {
      "id": id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
