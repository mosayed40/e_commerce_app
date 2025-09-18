import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/auth/check_email_signup.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/valid_input.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class CheckEamil extends StatelessWidget {
  const CheckEamil({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEamilControllerImp myController = Get.put(CheckEamilControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "27".tr,
            style: TextStyle(color: AppColors.textColor_2, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        alignment: Alignment.center,
        child: Form(
          key: myController.formState,
          child: ListView(
            children: [
              const SizedBox(height: 80),
              const CustomTextTitleAuth(textTitle: "28"),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(textBody: "29"),
              const SizedBox(height: 60),

              CustomTextFormAuth(
                valid: (val) {
                  return vaildInput(val!, 6, 50, "email");
                },
                labelText: "labelEmail",
                hintText: "lintEmail",
                suffixIcon: Icons.email_outlined,
                myController: myController.email,
              ),
              SizedBox(height: 15),

              const SizedBox(height: 30),
              CustomButtonAuth(
                text: "30",
                onPressed: () {
                  myController.checkEmail();
                  // myController.goToVerfiyCodeSignUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
