import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageProductDetails extends StatelessWidget {
  final String linkImage;
  const CustomImageProductDetails({super.key, required this.linkImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: linkImage, fit: BoxFit.fill);
  }
}
