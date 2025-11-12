import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/auth/signup_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/valid_input.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_signup.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    bool isShowPassword = true;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [Expanded(flex: 4, child: CustomTitlePage(title: "signUp"))],
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDatatRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            alignment: Alignment.center,
            child: Form(
              key: controller.signUpFormState,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(textTitle: "titleSignPages"),
                  const SizedBox(height: 20),
                  const CustomTextBodyAuth(textBody: "bodySignUpPage"),
                  const SizedBox(height: 60),
                  CustomTextFormAuth(
                    valid: (val) {
                      return vaildInput(val!, 5, 50, "UserName");
                    },
                    labelText: "lintUserName",
                    hintText: "lintUserName",
                    suffixIcon: Icons.person_outline,
                    controller: controller.username,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormAuth(
                    valid: (val) {
                      return vaildInput(val!, 11, 50, "email");
                    },
                    labelText: "labelEmail",
                    hintText: "lintEmail",
                    suffixIcon: Icons.email_outlined,
                    controller: controller.email,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormAuth(
                    valid: (val) {
                      return vaildInput(val!, 11, 15, "phone");
                    },
                    labelText: "labelPhone",
                    hintText: "lintPhone",
                    suffixIcon: Icons.phone_outlined,
                    controller: controller.phone,
                  ),
                  const SizedBox(height: 20),
                  GetBuilder<SignUpControllerImp>(
                    builder: (controller) => CustomTextFormAuth(
                      obscureText: isShowPassword,
                      onTapIcon: () {
                        isShowPassword = isShowPassword == true ? false : true;
                        controller.update();
                      },
                      valid: (val) {
                        return vaildInput(val!, 6, 30, "password");
                      },
                      labelText: "labelPassword",
                      hintText: "lintPasword",
                      suffixIcon: Icons.lock_outlined,
                      controller: controller.password,
                    ),
                  ),

                  const SizedBox(height: 40),
                  CustomButtonAuth(
                    text: "signUp",
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextSignUp(
                    textBody: "textPageSignUp",
                    textLink: "linkPageSignUp",
                    onPressed: () {
                      controller.goToSignIN();
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
