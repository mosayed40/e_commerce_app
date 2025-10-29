import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';

class HandlingDatatView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDatatView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 300, height: 300),
          )
        : statusRequest == StatusRequest.offlinefailure
        ? const Center(child: Text("offline failure..."))
        : statusRequest == StatusRequest.serverfailure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.serverfailure,
              width: 300,
              height: 300,
            ),
          )
        : statusRequest == StatusRequest.failure
        ? const Center(
            heightFactor: 25.0,
            child: Text("No Data ", style: TextStyle(fontSize: 24)),
          )
        : widget;
  }
}

class HandlingDatatRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDatatRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 300, height: 300),
          )
        : statusRequest == StatusRequest.offlinefailure
        ? const Center(child: Text("offline failure___"))
        : statusRequest == StatusRequest.serverfailure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.serverfailure,
              width: 300,
              height: 300,
            ),
          )
        : widget;
  }
}
