import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:e_commerce_app/controller/auth/forget_password/verfiy_code_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VirfiyCodeControllerImp controller = Get.put(VirfiyCodeControllerImp());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [Expanded(flex: 4, child: CustomTitlePage(title: "42"))],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        alignment: Alignment.center,
        child: ListView(
          children: [
            Lottie.asset(AppImageAsset.verfiyEmail, height: 150, width: 150),
            const SizedBox(height: 20),
            const CustomTextTitleAuth(textTitle: "40"),
            const SizedBox(height: 20),
            const CustomTextBodyAuth(textBody: "41"),
            const SizedBox(height: 50),
            OTPTextField(
              length: 5,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: TextStyle(fontSize: 17),
              onCompleted: (String verfiycode) {
                controller.goToReastPassword(verfiycode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
