import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class VerfiycodeSignUpData {
  Crud crud;

  VerfiycodeSignUpData(this.crud);

  postData(String email, String verfiycode) async {
    var response = await crud.postData(AppLinkApi.verfiycodeSignUp, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold(
      (l) => l, // Handle failure
      (r) => r, // Handle success
    );
  }
}
