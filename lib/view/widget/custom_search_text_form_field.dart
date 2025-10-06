import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchTextFormField extends StatelessWidget {
  final String hintText;
  final void Function()? onPressed;
  const CustomSearchTextFormField({
    super.key,
    required this.hintText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.search, color: AppColors.textColor_2),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF9A9999), fontSize: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}

//  TextFormField(
//               decoration: InputDecoration(
//                 prefixIcon: IconButton(
//                   onPressed: onPressedSearch,
//                   icon: Icon(Icons.search, color: AppColors.textColor_2),
//                 ),
//                 hintText: titleAppBar.tr,
//                 hintStyle: const TextStyle(
//                   color: Color(0xFF9A9999),
//                   fontSize: 16,
//                 ),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[300],
//               ),
//             ),
