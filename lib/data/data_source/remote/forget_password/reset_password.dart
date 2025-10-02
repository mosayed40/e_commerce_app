import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class ResetPassowrdData {
  Crud crud;
  ResetPassowrdData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLinkApi.resetpassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
