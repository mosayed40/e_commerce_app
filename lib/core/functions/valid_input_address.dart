import 'package:get/get.dart';

String? validInputAddress(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return 'الحقل لا يمكن أن يكون فارغاً';
  }

  if (type == "UserName") {
    if (!GetUtils.isUsername(val)) {
      return 'اسم المستخدم غير صالح';
    }
  }

  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'رقم الهاتف غير صالح';
    }
  }

  if (type == "City") {
    if (val.length < 3) {
      return 'اسم المدينة قصير جداً';
    }
  }

  if (type == "Street") {
    if (val.length < 3) {
      return 'اسم الشارع قصير جداً';
    }
  }

  if (val.length < min) {
    return 'يجب ألا يقل الإدخال عن $min حروف';
  }

  if (val.length > max) {
    return 'يجب ألا يزيد الإدخال عن $max حروف';
  }

  return null;
}
