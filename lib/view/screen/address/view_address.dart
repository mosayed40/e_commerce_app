import 'package:e_commerce_app/controller/address/view_address_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerViewAddressImp());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        actions: [
          CustomIconBack(),
          SizedBox(width: 20),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              "View Addresses",
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonColor,
        onPressed: () {
          Get.toNamed(AppRoute.mapDemo);
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      //
      body: GetBuilder<ControllerViewAddressImp>(
        builder: (controller) {
          if (controller.data.isEmpty) {
            return const Center(
              child: Text(
                "لا يوجد عناوين حالياً",
                style: TextStyle(fontSize: 16),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return CardAddress(
                addressModel: controller.data[index],
                controller: controller,
              );
            },
          );
        },
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final ControllerViewAddress controller;
  const CardAddress({
    super.key,
    required this.addressModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addressModel.addressName ?? "لا يوجد عنوان",
            style: TextStyle(color: Colors.grey[600], fontSize: 30),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text("ctiy : ${addressModel.addressCity ?? ''} "),

                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("street : ${addressModel.addressStreet ?? ''}"),
                      Text("phone : ${addressModel.addressPhone}"),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 15,
                child: IconButton(
                  icon: const Icon(Icons.edit, color: AppColors.buttonColor),
                  onPressed: () {},
                ),
              ),

              Positioned(
                top: 45,
                right: 15,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.deleteAddress(addressModel.addressId!);
                  },
                ),
              ),
            ],
          ),
          Container(
            height: Get.height / 3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "Map",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
