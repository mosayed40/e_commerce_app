import 'package:e_commerce_app/controller/orders/order_details_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsControllerImp controller = Get.put(OrderDetailsControllerImp());
    final listModel = controller.ordersModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: GetBuilder<OrderDetailsControllerImp>(
          builder: (controller) => HandlingDatatView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.buttonColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Status : ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "${controller.printOrderStatus(listModel!.ordersStatus!)} ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Orders Id :       ${listModel.ordersId}",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                Table(
                  children: [
                    TableRow(
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(color: const Color(0xFF0B02BD)),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Ctv",
                          style: TextStyle(color: const Color(0xFF0B02BD)),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Price",
                          style: TextStyle(color: const Color(0xFF0B02BD)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    TableRow(
                      children: [
                        Text("shose", textAlign: TextAlign.center),
                        Text("2", textAlign: TextAlign.center),

                        Text("114 \$", textAlign: TextAlign.center),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("phone", textAlign: TextAlign.center),
                        Text("1", textAlign: TextAlign.center),

                        Text("150 \$", textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("delvery Price : "), Text("50 \$")],
                  ),
                ),

                Container(
                  height: 3,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  color: Colors.black,
                ),

                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total Price : ",
                        style: TextStyle(
                          color: const Color(0xFF0B02BD),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${listModel.ordersTotalPrice} \$",
                        style: TextStyle(
                          color: const Color(0xFF0B02BD),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Address Name : ${listModel.addressName}"),
                      Text("City : ${listModel.addressCity}"),
                      Text("Street : ${listModel.addressStreet}"),
                      Text("Phone Number : ${listModel.addressPhone}"),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber,
                  ),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    initialCameraPosition: controller.cameraPosition!,
                    onMapCreated: (GoogleMapController controllerMap) {
                      controller.controllerMap.complete(controllerMap);
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
