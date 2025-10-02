import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:e_commerce_app/controller/forget_password/verfiy_code_controller.dart';
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
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "42".tr,
            style: const TextStyle(color: AppColors.textColor_2, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        alignment: Alignment.center,
        child: ListView(
          children: [
            const SizedBox(height: 50),
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
              onCompleted: (verfiycode) {
                controller.goToReastPassword(verfiycode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
