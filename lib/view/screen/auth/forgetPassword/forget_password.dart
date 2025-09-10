import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/valid_input.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "Forget Password",
            style: TextStyle(color: AppColors.textColor_2, fontSize: 20),
          ),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (myController) => HandlingDatatRequest(
          statusRequest: myController.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            alignment: Alignment.center,
            child: Form(
              key: myController.formState,
              child: ListView(
                children: [
                  const SizedBox(height: 80),
                  const CustomTextTitleAuth(textTitle: "27"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(textBody: "29"),
                  const SizedBox(height: 60),
                  CustomTextFormAuth(
                    valid: (val) {
                      return VaildInput(val!, 5, 30, "email");
                    },
                    labelText: "labelEmail",
                    hintText: "lintEmail",
                    suffixIcon: Icons.email_outlined,
                    myController: myController.email,
                  ),
                  const SizedBox(height: 30),
                  CustomButtonAuth(
                    text: "30",
                    onPressed: () {
                      myController.checkEmail();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
