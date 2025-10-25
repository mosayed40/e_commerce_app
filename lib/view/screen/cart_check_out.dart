import 'package:e_commerce_app/controller/cart_check_out_controller.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/view/widget/check_out.dart/custom_button_check_out.dart';
import 'package:e_commerce_app/view/widget/check_out.dart/custom_delivery_address.dart';
import 'package:e_commerce_app/view/widget/check_out.dart/custom_display_values.dart';
import 'package:e_commerce_app/view/widget/check_out.dart/custom_enter_discount_coupon.dart';
import 'package:e_commerce_app/view/widget/check_out.dart/custom_payment_method.dart';
import 'package:e_commerce_app/view/widget/check_out.dart/custom_section_title.dart';
import 'package:e_commerce_app/view/widget/check_out.dart/custom_total_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductsDetails extends StatelessWidget {
  const CartProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerInCartImp());
    Get.put(CartCheckOutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Check Out", style: TextStyle(color: Colors.grey)),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomButtonCheckOut(
        text: "Check Out",
        onPressed: () {},
      ),

      body: GetBuilder<ControllerInCartImp>(
        builder: (cartController) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: ListView(
            children: [
              cartController.couponName == null
                  ? CustomEnterDiscountCoupon(
                      controller: cartController.couponCode,
                      hintText: "Coupon Code...",
                      labelText: "استخدم كوبون الخصم",
                      onPressed: () {
                        cartController.checkCoupon(
                          cartController.couponCode.text,
                        );
                      },
                    )
                  : Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: Text(
                        "Coupon Code : ${cartController.couponName}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: Column(
                  children: [
                    CustomDisplayValues(
                      title: "Product price : ",
                      value: "${cartController.totalPrice} ج.م",
                    ),
                    CustomDisplayValues(
                      title: "Delivery value : ",
                      value: "150 ج.م",
                    ),
                    CustomDisplayValues(
                      title: "Descount Couopon : ",
                      value: "${cartController.descountCoupon} %",
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      color: Colors.black,
                    ),
                    CustomTotalPrice(
                      title: "Total Parice :",
                      price: "${cartController.getTotalPrice() + 150} ج.م",
                    ),
                  ],
                ),
              ),
              const CustomSectionTitle(title: "Choose a payment method"),
              GetBuilder<CartCheckOutControllerImp>(
                builder: (controller) => Card(
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomPaymentMethod(
                        title: "الدفع بالبطاقة",
                        onPressed: () {
                          controller.choosePaymentMethod("البطاقة");
                        },
                        active: controller.paymentMethod == "البطاقة"
                            ? true
                            : false,
                      ),
                      CustomPaymentMethod(
                        title: "الدفع نقدا عند الاستلام",
                        onPressed: () {
                          controller.choosePaymentMethod("نقدا");
                        },
                        active: controller.paymentMethod == "نقدا"
                            ? true
                            : false,
                      ),
                      CustomPaymentMethod(
                        title: "الدفع عن طريق المحفظة الالكترونية",
                        onPressed: () {
                          controller.choosePaymentMethod("التحويل الالكتروني");
                        },
                        active: controller.paymentMethod == "التحويل الالكتروني"
                            ? true
                            : false,
                      ),
                    ],
                  ),
                ),
              ),
              const CustomSectionTitle(title: "Choose the delivery address"),
              GetBuilder<CartCheckOutControllerImp>(
                builder: (controller) => Column(
                  children: [
                    ...List.generate(
                      controller.data.length,
                      (i) => CustomDeliveryAddress(
                        onTap: () {
                          controller.chooseAddressId(
                            "${controller.data[i].addressId}",
                          );
                        },
                        titleAddress: "${controller.data[i].addressName}",
                        governorate: "${controller.data[i].addressCity}",
                        address: "${controller.data[i].addressStreet}",
                        phone: "${controller.data[i].addressPhone}",
                        active:
                            controller.addressId ==
                                "${controller.data[i].addressId}"
                            ? true
                            : false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
