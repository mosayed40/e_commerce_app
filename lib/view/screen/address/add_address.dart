import 'package:e_commerce_app/controller/address/add_address_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/valid_input_address.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/view/widget/address/custom_text_form.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/view/widget/custom_google_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerAddAddressImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [
          CustomIconBack(),
          Expanded(flex: 4, child: CustomTitlePage(title: "Add Addresses")),
        ],
      ),

      body: GetBuilder<ControllerAddAddressImp>(
        builder: (controller) => HandlingDatatRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            alignment: Alignment.center,
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                ListView(
                  children: [
                    Form(
                      key: controller.addAddressFormState,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CustomTextForm(
                              controller: controller.name,
                              labelText: "Name",
                              hintText: " address name",
                              valid: (val) {
                                return validInputAddress(
                                  val!,
                                  6,
                                  50,
                                  "AddressName",
                                );
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextForm(
                              controller: controller.phone,
                              labelText: "Phone",
                              hintText: "phone number",
                              valid: (val) {
                                return validInputAddress(val!, 10, 11, "Phone");
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextForm(
                              controller: controller.city,
                              labelText: "City",
                              hintText: "city name",
                              valid: (val) {
                                return validInputAddress(val!, 3, 50, "City");
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextForm(
                              controller: controller.street,
                              labelText: "Street",
                              hintText: "street name",
                              valid: (val) {
                                return validInputAddress(val!, 3, 50, "Street");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    CustomGoogleMap(
                      marker: [
                        Marker(
                          markerId: MarkerId("1"),
                          position: LatLng(controller.lat!, controller.long!),
                        ),
                      ],
                      cameraPosition: CameraPosition(
                        target: LatLng(controller.lat!, controller.long!),
                        zoom: 14.4746,
                      ),
                      onMapCreated: (GoogleMapController controllerMap) {
                        controller.controllerMap.complete(controllerMap);
                      },
                    ),
                  ],
                ),
                Positioned(
                  width: Get.width / 1.5,
                  bottom: 0,
                  child: CustomButtonAuth(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
