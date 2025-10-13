import 'package:e_commerce_app/core/localization/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/binding/initial_binding.dart';
import 'package:e_commerce_app/core/localization/changelocal.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController myController = Get.put(LocaleController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      translations: MyTranslation(),
      locale: myController.language,
      theme: myController.appThemeLanguage,
      initialBinding: Initialbinding(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
