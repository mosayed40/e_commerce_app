import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addAddress(
    int usersid,
    String phone,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(AppLinkApi.addAddress, {
      "users_id": usersid.toString(),
      "name": name.toString(),
      "phone": phone.toString(),
      "city": city.toString(),
      "street": street.toString(),
      "lat": lat.toString(),
      "long": long.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editAddress(
    String addressid,
    String phone,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(AppLinkApi.eidtAddress, {
      "address_id": addressid.toString(),
      "name": name.toString(),
      "phone": phone.toString(),
      "city": city.toString(),
      "street": street.toString(),
      "lat": lat.toString(),
      "long": long.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(int addressid) async {
    var response = await crud.postData(AppLinkApi.deleteAddress, {
      "address_id": addressid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  viewAddress(int usersid) async {
    var response = await crud.postData(AppLinkApi.viewAddress, {
      "users_id": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
