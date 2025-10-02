import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:e_commerce_app/controller/auth/verfiy_code_signup_controler.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VirfiyCodeSignUpControllerImp());
    OtpFieldController otpController = Get.put(OtpFieldController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "42".tr,
            style: TextStyle(color: AppColors.textColor_2, fontSize: 20),
          ),
        ),
      ),
      body: GetBuilder<VirfiyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDatatRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            alignment: Alignment.center,
            child: ListView(
              children: [
                const SizedBox(height: 50),
                const CustomTextTitleAuth(textTitle: "40"),
                const SizedBox(height: 20),
                const CustomTextBodyAuth(textBody: "41"),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 50),
                  child: Text(
                    "${controller.email}",
                    textAlign: TextAlign.center,
                  ),
                ),
                Lottie.asset(
                  AppImageAsset.verfiyEmail,
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 50),
                OTPTextField(
                  controller: otpController,
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17),
                  onCompleted: (String verfiycantionCode) {
                    controller.goToSuccessSignUp(verfiycantionCode);
                  },
                ),
                SizedBox(height: 50),
                Center(
                  child: InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Text(
                      "resendVerfiyCode".tr,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
