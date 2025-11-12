import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/auth/forget_password/reset_password_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/valid_input.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReastPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [Expanded(flex: 4, child: CustomTitlePage(title: "43"))],
      ),
      body: GetBuilder<ReastPasswordControllerImp>(
        builder: (controller) => HandlingDatatRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            alignment: Alignment.center,
            child: Form(
              key: controller.resetPasswordFormState,
              child: ListView(
                children: [
                  const CustomTextTitleAuth(textTitle: "35"),
                  const SizedBox(height: 15),
                  const CustomTextBodyAuth(textBody: "34"),
                  const SizedBox(height: 60),
                  CustomTextFormAuth(
                    valid: (val) {
                      return vaildInput(val!, 5, 30, "password");
                    },
                    labelText: "labelPassword",
                    hintText: "lintPasword",
                    suffixIcon: Icons.lock_outlined,
                    controller: controller.password,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormAuth(
                    valid: (val) {
                      return vaildInput(val!, 5, 30, "password");
                    },
                    labelText: "labelConfirmPassword",
                    hintText: "hintConfirmPassword",
                    suffixIcon: Icons.lock_outlined,
                    controller: controller.repassword,
                  ),
                  const SizedBox(height: 80),
                  CustomButtonAuth(
                    text: "33",
                    onPressed: () {
                      controller.resetPassword();
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
