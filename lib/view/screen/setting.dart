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
    return SizedBox(
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
              Positioned(
                top: 40,
                left: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mustafa Sayed",
                      style: const TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "moustafa.2950@gmail.com",
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,

                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.changeLange("ar");
                      },
                      icon: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2F1E49),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text("ع", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.changeLange("en");
                      },
                      icon: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2F1E49),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "En",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          CustomSettingPageOptins(),
          CustomLangSetting(),
        ],
      ),
    );
  }
}
