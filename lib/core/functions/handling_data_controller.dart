import 'package:e_commerce_app/core/class/status_request.dart';

handingData(dynamic response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
