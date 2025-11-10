import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageProductDetails extends StatelessWidget {
  final String linkImage;
  const CustomImageProductDetails({super.key, required this.linkImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width / 1.2,
      child: Center(
        child: CachedNetworkImage(imageUrl: linkImage, fit: BoxFit.cover),
      ),
    );
  }
}
