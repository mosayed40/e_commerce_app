import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/screen/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:e_commerce_app/core/middle_ware/my_app_midel_ware.dart';
import 'package:e_commerce_app/test_view.dart';
import 'package:e_commerce_app/view/screen/auth/check_email.dart';
import 'package:e_commerce_app/view/screen/auth/forgetPassword/forget_password.dart';
import 'package:e_commerce_app/view/screen/auth/login.dart';
import 'package:e_commerce_app/view/screen/auth/forgetPassword/reset_password.dart';
import 'package:e_commerce_app/view/screen/auth/sign_up.dart';
import 'package:e_commerce_app/view/screen/auth/forgetPassword/success_reset.dart';
import 'package:e_commerce_app/view/screen/auth/success_signup.dart';
import 'package:e_commerce_app/view/screen/auth/forgetPassword/verfiy_code.dart';
import 'package:e_commerce_app/view/screen/auth/verfiy_code_signup.dart';
import 'package:e_commerce_app/view/screen/on_boarding.dart';
import 'package:e_commerce_app/view/screen/language.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.test, page: () => const TestView()),
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [MyAppMiddleware()],
  ),
  // Auth Routes
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignup()),
  GetPage(name: AppRoute.checkEmail, page: () => const CheckEamil()),
  GetPage(
    name: AppRoute.verfiyCodeForgetPassword,
    page: () => const VerfiyCode(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoute.verfiyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),
  // Main Routes
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //Pages Routes
  GetPage(name: AppRoute.home, page: () => const HomeScreenPage()),
];
