import 'package:e_commerce_app/controller/address/edit_map_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';

class EditMapDemo extends StatelessWidget {
  const EditMapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditMapControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Map Sample",
          style: TextStyle(color: Colors.grey[600]),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CustomIconBack(),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<EditMapControllerImp>(
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
                          controller.editMarkers(latLng);
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
                              controller.goToEditAddressDataPage();
                            },
                            child: Text(
                              "أكمال التعديل",
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
