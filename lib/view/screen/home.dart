// import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<LocaleController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeControllerImp myController = Get.put(HomeControllerImp());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: 35),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.textColor_2,
                        ),
                        hintText: "find product",
                        hintStyle: const TextStyle(
                          color: AppColors.textColor_2,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 60,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        size: 30,
                        color: AppColors.textColor_2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   height: 200,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: AppColors.primaryColor,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Text(
            //             "Hello",
            //             style: TextStyle(
            //               fontSize: 30,
            //               color: AppColors.backgroundColor,
            //             ),
            //           ),
            //           Text(
            //             "discound product",
            //             style: TextStyle(
            //               fontSize: 20,
            //               color: AppColors.textColor_2,
            //             ),
            //           ),
            //         ],
            //       ),
            //       Positioned(
            //         top: -15,
            //         right: -15,
            //         child: Container(
            //           height: 170,
            //           width: 170,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(70),
            //             color: AppColors.textColor_2,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,
              ),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(
                        "A summer surprise",
                        style: TextStyle(
                          color: AppColors.textColor_2,
                          fontSize: 20,
                        ),
                      ),

                      subtitle: Text(
                        "Cash back 25%",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: -20,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: AppColors.textColor_2,
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
