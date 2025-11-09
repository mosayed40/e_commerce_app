import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/controller/address/add_map_controller.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';

class AddMapDemo extends StatelessWidget {
  const AddMapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerMapImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [
          CustomIconBack(),
          Expanded(flex: 4, child: CustomTitlePage(title: "Add Map Sample")),
        ],
      ),
      body: GetBuilder<ControllerMapImp>(
        builder: (controller) => HandlingDatatView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              if (controller.kGooglePlex != null)
                Expanded(
                  child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      GoogleMap(
                        onTap: (latLng) {
                          controller.addMarkers(latLng);
                        },
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        myLocationEnabled: true,
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.controllerMap.complete(controllerMap);
                        },
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          width: 170,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              controller.goToAddAddressDataPage();
                            },
                            child: Text(
                              "أكمال",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
