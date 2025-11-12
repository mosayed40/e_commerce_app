import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/view/widget/custom_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final TextEditingController myController;
  final void Function()? onPressedNotifications;
  final void Function()? onPressedPerson;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    this.onPressedNotifications,
    this.onPressedPerson,
    required this.onPressedSearch,
    required this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Stack(
        children: [
          Container(
            height: 130,
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: CustomSearchTextFormField(
              myController: myController,
              hintText: titleAppBar.tr,
              onPressedSearch: onPressedSearch,
              onChanged: onChanged,
            ),
          ),
          Positioned(
            top: 0,
            left: controller.lang == "ar" ? 0 : null,
            right: controller.lang == "ar" ? null : 0,
            child: IconButton(
              onPressed: onPressedNotifications,
              icon: const Icon(
                Icons.notifications_active,
                size: 30,
                color: Color(0xFFCDCACA),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: controller.lang == "ar" ? 50 : null,
            right: controller.lang == "ar" ? null : 50,
            child: IconButton(
              onPressed: onPressedPerson,
              icon: Icon(
                Icons.person,
                size: 30,
                color: const Color(0xFFCDCACA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
