import 'package:get/get.dart';
import 'package:e_commerce_app/core/class/c_r_u_d.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
