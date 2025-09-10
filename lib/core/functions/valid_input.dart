import 'package:get/get.dart';

VaildInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return 'Input cannot be empty';
  }

  if (type == "UserName") {
    if (!GetUtils.isUsername(val)) {
      return 'Invalid username';
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return 'Invalid email';
    }
  }

  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Invalid phone number';
    }
  }

  if (val.length < min) {
    return 'Input must be at least $min characters long';
  }

  if (val.length > max) {
    return 'Input must be at most $max characters long';
  }
}
