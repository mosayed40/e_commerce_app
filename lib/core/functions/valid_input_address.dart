import 'package:get/get.dart';

vaildInputAddress(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return 'Input cannot be empty';
  }

  if (type == "UserName") {
    if (!GetUtils.isUsername(val)) {
      return 'Invalid username';
    }
  }

  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Invalid phone number';
    }
  }

  if (type == "City") {
    if (!GetUtils.isUsername(val)) {
      return 'Invalid City';
    }
  }

  if (type == "Street") {
    if (!GetUtils.isUsername(val)) {
      return 'Invalid Street';
    }
  }

  if (type == "Latitude") {
    if (!GetUtils.isNum(val)) {
      return 'Invalid Latitude';
    }
  }
  if (type == "longitude") {
    if (!GetUtils.isNum(val)) {
      return 'Invalid longitude';
    }
  }

  if (val.length < min) {
    return 'Input must be at least $min characters long';
  }

  if (val.length > max) {
    return 'Input must be at most $max characters long';
  }
}
