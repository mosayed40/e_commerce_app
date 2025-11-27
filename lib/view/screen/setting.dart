import 'package:e_commerce_app/controller/setting_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/view/widget/setting/Custom_setting_page_optins.dart';
import 'package:e_commerce_app/view/widget/setting/custom_lang_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/localization/changelocal.dart';

class Setting extends GetView<LocaleController> {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    SettingControllerImp controllerImp = Get.put(SettingControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.center,
            children: [
              Container(height: Get.width / 1.8, color: AppColors.primaryColor),
              Positioned(
                top: Get.width / 2.5,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(AppImageAsset.avatar),
                ),
              ),
              Positioned(
                top: 30,
                right: controllerImp.lang == "en" ? 10 : null,
                left: controllerImp.lang == "ar" ? 10 : null,
                child: SizedBox(
                  width: Get.width / 1 - 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mustafa Sayed",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "moustafa.2950@gmail.com",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: controllerImp.lang == "en" ? 10 : null,
                left: controllerImp.lang == "en" ? null : 10,
                child: CustomLangSetting(),
              ),
            ],
          ),
          const SizedBox(height: 50),
          CustomSettingPageOptins(),
        ],
      ),
    );
  }
}
