import 'package:e_commerce_app/view/widget/custom_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchAppBar extends StatelessWidget {
  final String titleAppBar;
  final TextEditingController myController;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  const CustomSearchAppBar({
    super.key,
    required this.titleAppBar,
    required this.onPressedSearch,
    required this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(bottom: 10),
      alignment: Alignment.bottomCenter,
      child: CustomSearchTextFormField(
        myController: myController,
        hintText: titleAppBar.tr,
        onPressedSearch: onPressedSearch,
        onChanged: onChanged,
      ),
    );
  }
}
