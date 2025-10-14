import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/custom_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final TextEditingController myController;
  final void Function()? onPressedNotifications;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    this.onPressedNotifications,
    this.onPressedFavorite,
    required this.onPressedSearch,
    required this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: CustomSearchTextFormField(
              myController: myController,
              hintText: titleAppBar.tr,
              onPressedSearch: onPressedSearch,
              onChanged: onChanged,
            ),
          ),
          const SizedBox(width: 10),
          // notifications
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: onPressedNotifications,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: AppColors.textColor_2,
              ),
            ),
          ),
          const SizedBox(width: 10),
          //Favorite
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: AppColors.textColor_2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
