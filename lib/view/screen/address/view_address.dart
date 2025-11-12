import 'package:e_commerce_app/controller/address/view_address_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/view/widget/custom_google_map.dart';
import 'package:e_commerce_app/view/widget/order/custom_card_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerViewAddressImp());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: const [
          CustomIconBack(),
          Expanded(flex: 4, child: CustomTitlePage(title: "Addresses")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonColor,
        onPressed: () {
          Get.toNamed(AppRoute.addMapDemo);
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: GetBuilder<ControllerViewAddressImp>(
        builder: (controller) =>
            // controller.data.isEmpty
            // ? const Center(
            //     child: Text(
            //       "لا يوجد عناوين حالياً",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   )
            // :
            HandlingDatatView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardAddress(
                  addressModel: controller.data[index],
                  controller: controller,
                ),
              ),
            ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final ControllerViewAddressImp controller;

  const CardAddress({
    super.key,
    required this.addressModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              addressModel.addressName ?? "",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 30),
            ),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: CustomTextAddress(
                    title: "addressCity",
                    body: addressModel.addressCity!,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextAddress(
                        title: "addressStreet",
                        body: addressModel.addressStreet!,
                      ),
                      CustomTextAddress(
                        title: "phoneNumber",
                        body: "${addressModel.addressPhone}",
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: controller.lang == "ar" ? 15 : null,
                right: controller.lang == "ar" ? null : 15,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.buttonColor,
                      ),
                      onPressed: () => controller.goToEditAddress(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          controller.deleteAddress(addressModel.addressId!),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: Get.height / 3.5,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
            ),
            child: HandlingDatatView(
              statusRequest: controller.statusRequest,
              widget: CustomGoogleMap(
                marker: controller.markers,
                cameraPosition: controller.cameraPosition,
                onMapCreated: (GoogleMapController controllerMap) {
                  controller.controllerMap.complete(controllerMap);
                  controller.lat = addressModel.addressLat!;
                  controller.lat = addressModel.addressLong!;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
