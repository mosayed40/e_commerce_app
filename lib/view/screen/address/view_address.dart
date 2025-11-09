import 'package:e_commerce_app/controller/address/view_address_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/middle_ware/address_model.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
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
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [
          CustomIconBack(),
          SizedBox(width: 20),
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
        builder: (controller) => controller.data.isEmpty
            ? const Center(
                child: Text(
                  "لا يوجد عناوين حالياً",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : HandlingDatatView(
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
                  title: Text("city : ${addressModel.addressCity ?? ''}"),
                  subtitle: Column(
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
                  onPressed: () => controller.goToEditAddress(),
                ),
              ),
              Positioned(
                top: 45,
                right: 15,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () =>
                      controller.deleteAddress(addressModel.addressId!),
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
            child: GoogleMap(
              mapType: MapType.normal,
              markers: controller.markers.toSet(),
              initialCameraPosition: controller.kGooglePlex!,
              // CameraPosition(target: LatLng(0.0, 0.0)),
              onMapCreated: (GoogleMapController controllerMap) {
                if (controller.controllerMap.isCompleted) {
                  controller.controllerMap.complete(controllerMap);
                }
                if (addressModel.addressLat != null ||
                    addressModel.addressLong != null) {
                  controller.setInitialMarker(
                    addressModel.addressLat ?? 0.0,
                    addressModel.addressLong ?? 0.0,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
