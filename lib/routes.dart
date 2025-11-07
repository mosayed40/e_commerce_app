import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/screen/address/add_address.dart';
import 'package:e_commerce_app/view/screen/address/edit_map_demo.dart';
import 'package:e_commerce_app/view/screen/address/eidt_address.dart';
import 'package:e_commerce_app/view/screen/address/add_map_demo.dart';
import 'package:e_commerce_app/view/screen/address/view_address.dart';
import 'package:e_commerce_app/view/screen/cart.dart';
import 'package:e_commerce_app/view/screen/cart_check_out.dart';
import 'package:e_commerce_app/view/screen/home_screen.dart';
import 'package:e_commerce_app/view/screen/items.dart';
import 'package:e_commerce_app/view/screen/myfavorite.dart';
import 'package:e_commerce_app/view/screen/orders/order_details.dart';
import 'package:e_commerce_app/view/screen/orders/pending_order.dart';
import 'package:e_commerce_app/view/screen/product_details.dart';
import 'package:e_commerce_app/view/screen/setting.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:e_commerce_app/core/middle_ware/my_app_midel_ware.dart';
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
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [MyAppMiddleware()],
  ),
  // Main Routes
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
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
  //Pages Routes
  GetPage(name: AppRoute.home, page: () => const HomeScreenPage()),
  GetPage(name: AppRoute.items, page: () => const ItemsPage()),
  GetPage(name: AppRoute.setting, page: () => const Setting()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(
    name: AppRoute.cartProductsDetails,
    page: () => const CartProductsDetails(),
  ),

  GetPage(
    name: AppRoute.shoppingCartPage,
    page: () => const ShoppingCartPage(),
  ),
  // Address Routes
  GetPage(name: AppRoute.addMapDemo, page: () => const AddMapDemo()),
  GetPage(name: AppRoute.addAddress, page: () => const AddAddress()),
  GetPage(name: AppRoute.editMapDemo, page: () => const EditMapDemo()),
  GetPage(name: AppRoute.editAddress, page: () => const EditAddress()),
  GetPage(name: AppRoute.viewAddress, page: () => const ViewAddress()),
  // Orders Routes
  GetPage(name: AppRoute.pendingOrder, page: () => const PendingOrder()),
  GetPage(name: AppRoute.orderDetails, page: () => const OrderDetails()),
];
