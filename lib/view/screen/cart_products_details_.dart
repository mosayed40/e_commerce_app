import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductsDetails extends StatelessWidget {
  const CartProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ControllerInCartImp controller = Get.put(ControllerInCartImp());
    // final couponModel = controlle.couponModel;
    return Scaffold(
      appBar: AppBar(),

      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: AppColors.buttonColor,
      //     borderRadius: BorderRadius.circular(12),
      //   ),
      //   margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      //   child: IconButton(
      //     onPressed: () {},
      //     icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 26),
      //   ),
      // ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(
          children: [
            GetBuilder<ControllerInCartImp>(
              builder: (controller) => controller.couponName == null
                  ? Container(
                      height: 120,
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.couponCode,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsetsDirectional.symmetric(
                                      vertical: 8,
                                      horizontal: 10,
                                    ),
                                hintText: "Coupon Code...",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            onPressed: () {
                              controller.checkCoupon(
                                controller.couponCode.text,
                              );
                            },
                            icon: const Icon(
                              Icons.local_offer,
                              color: Colors.white,
                              size: 26,
                            ),
                            label: const Text(
                              "استخدم كوبون الخصم",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),

                      child: Text(
                        "Coupon Code : ${controller.couponName}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
            ),

            GetBuilder<ControllerInCartImp>(
              builder: (controller) => Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product price : "),
                        Text("${controller.totalPrice} ج.م"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Delivery value : "), Text("150 ج.م")],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Descount Couopon : "),
                        Text("${controller.descountCoupon} %"),
                      ],
                    ),

                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      color: Colors.black,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Parice : ",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          "${controller.getTotalPrice() + 150} ج.م",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("اختيار طريقة الدفع", style: TextStyle(fontSize: 24.0)),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0x792195F3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "الدفع بالبطاقة",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0x792195F3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "الدفع نقدا عند الاستلام",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0x792195F3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "الدفع  عن طؤيق انستا باي",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0x792195F3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      style: ButtonStyle(),
                      onPressed: () {},
                      child: Text(
                        "الدفع عن طريق المحفظة الالكترونية",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
