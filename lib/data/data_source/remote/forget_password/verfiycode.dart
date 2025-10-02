import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class VerfiyCodeForgetPassowrdData {
  Crud crud;
  VerfiyCodeForgetPassowrdData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinkApi.verfiycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
