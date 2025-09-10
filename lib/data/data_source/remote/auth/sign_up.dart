import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLinkApi.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold(
      (l) => l, // Handle failure
      (r) => r, // Handle success
    );
  }
}
