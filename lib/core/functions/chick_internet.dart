import 'dart:io' show InternetAddress, Platform;
import 'package:http/http.dart' as http;

Future<bool> checkInternet() async {
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      // الموبايل
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } else {
      // الويب
      final response = await http.get(
        Uri.parse("http://127.0.0.1/e_commerce_app"),
      );
      return response.statusCode == 200;
    }
  } catch (_) {
    return false;
  }
}
