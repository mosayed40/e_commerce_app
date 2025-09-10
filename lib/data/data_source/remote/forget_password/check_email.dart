import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLinkApi.checkemail, {"email": email});
    return response.fold(
      (l) => l, // Handle failure
      (r) => r, // Handle success
    );
  }
}
