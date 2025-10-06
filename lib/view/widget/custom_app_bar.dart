import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/custom_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavorite;
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    required this.onPressedIcon,
    required this.onPressedSearch,
    required this.onPressedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: CustomSearchTextFormField(
              hintText: titleAppBar.tr,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: AppColors.textColor_2,
              ),
            ),
          ),
          const SizedBox(width: 10),
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
