import 'package:e_commerce_app/controller/setting_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/localization/changelocal.dart';

class Setting extends GetView<LocaleController> {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    SettingControllerImp settingController = Get.put(SettingControllerImp());
    List data = [
      {
        "id": "1",
        "titel": "Disable Notifications",
        "icon": Switch(onChanged: (val) {}, value: true),
      },
      {"id": "2", "titel": "Address", "icon": Icon(Icons.location_on_outlined)},
      {
        "id": "3",
        "titel": "About us",
        "icon": Icon(Icons.help_outline_outlined),
      },
      {
        "id": "4",
        "titel": "Contact us",
        "icon": Icon(Icons.phone_callback_outlined),
      },
      {"id": "5", "titel": "LogOut", "icon": Icon(Icons.exit_to_app)},
    ];

    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.center,
            children: [
              Container(height: Get.width / 2, color: AppColors.primaryColor),
              Positioned(
                top: Get.width / 2.5,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(AppImageAsset.avatar),
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     controller.changeLange("en");
              //     Get.toNamed(AppRoute.home);
              //   },
              //   icon: Icon(Icons.language, color: Colors.white, size: 28),
              // ),
            ],
          ),
          const SizedBox(height: 100),
          ...List.generate(
            data.length,
            (i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      if (data[i]['id'] == "1") {
                      } else if (data[i]['id'] == "2") {
                      } else if (data[i]['id'] == "3") {
                      } else if (data[i]['id'] == "3") {
                      } else if (data[i]['id'] == "5") {
                        settingController.logOut();
                      }
                    },
                    title: Text("${data[i]['titel']}"),
                    trailing: data[i]['icon'],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
