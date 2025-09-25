import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    required this.onPressedIcon,
    required this.onPressedSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(Icons.search, color: AppColors.textColor_2),
                ),
                // hintText: "find product",
                hintText: titleAppBar,
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
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.notifications_active_outlined,
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
