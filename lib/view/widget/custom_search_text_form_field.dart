import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/constant/colors.dart';

class CustomSearchTextFormField extends StatelessWidget {
  final String hintText;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const CustomSearchTextFormField({
    Key? key,
    required this.hintText,
    required this.onPressedSearch,
    required this.onChanged,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: myController,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onPressedSearch,
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
      ),
    );
  }
}
