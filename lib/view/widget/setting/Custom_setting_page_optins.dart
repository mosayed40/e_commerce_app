import 'package:e_commerce_app/controller/setting_controller.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSettingPageOptins extends StatelessWidget {
  const CustomSettingPageOptins({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp settingController = Get.put(SettingControllerImp());

    List data = [
      {
        "id": "1",
        "titel": "notifications".tr,
        "icon": Switch(onChanged: (val) {}, value: false),
      },
      {
        "id": "2",
        "titel": "orders".tr,
        "icon": Icon(Icons.shopping_cart_checkout_outlined),
      },
      {
        "id": "3",
        "titel": "address".tr,
        "icon": Icon(Icons.location_on_outlined),
      },
      {
        "id": "4",
        "titel": "aboutUs".tr,
        "icon": Icon(Icons.help_outline_outlined),
      },
      {
        "id": "5",
        "titel": "contactUs".tr,
        "icon": Icon(Icons.phone_callback_outlined),
      },
      {"id": "6", "titel": "logOut".tr, "icon": Icon(Icons.exit_to_app)},
    ];
    return Column(
      children: [
        ...List.generate(
          data.length,
          (i) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Material(
                  child: ListTile(
                    onTap: () {
                      if (data[i]['id'] == "2") {
                        Get.toNamed(AppRoute.pendingOrder);
                      } else if (data[i]['id'] == "3") {
                        Get.toNamed(AppRoute.viewAddress);
                      } else if (data[i]['id'] == "4") {
                        print("About us");
                      } else if (data[i]['id'] == "5") {
                        print("Contact us");
                      } else if (data[i]['id'] == "6") {
                        settingController.logOut();
                      }
                    },
                    title: Text(
                      "${data[i]['titel']}",
                      style: TextStyle(
                        color: data[i]['id'] == "6" ? Colors.red : Colors.black,
                      ),
                    ),
                    trailing: data[i]['icon'],
                    iconColor: data[i]['id'] == "6" ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
