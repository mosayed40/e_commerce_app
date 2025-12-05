import 'package:e_commerce_app/controller/archive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showRating(BuildContext context, int orderId) {
  OrderArchiveControllerImp controller = Get.put(OrderArchiveControllerImp());

  final _dialog = RatingDialog(
    starSize: 35,
    initialRating: 1.0,
    title: Text(
      'titleRating'.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    message: Text(
      'messageRating'.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image: const FlutterLogo(size: 100),
    submitButtonText: 'buttonText'.tr,
    commentHint: 'commentText'.tr,
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      controller.ordersRating(orderId, response.rating, response.comment);
    },
  );

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => _dialog,
  );
}
