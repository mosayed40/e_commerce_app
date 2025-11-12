import 'package:e_commerce_app/controller/orders/order_details_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/view/widget/order/custom_body_table.dart';
import 'package:e_commerce_app/view/widget/order/custom_card_address.dart';
import 'package:e_commerce_app/view/widget/custom_google_map.dart';
import 'package:e_commerce_app/view/widget/order/custom_orderId.dart';
import 'package:e_commerce_app/view/widget/order/custom_status_order.dart';
import 'package:e_commerce_app/view/widget/order/custom_title_tabel.dart';
import 'package:e_commerce_app/view/widget/order/custom_total_price.dart';
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
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [
          CustomIconBack(),
          Expanded(
            flex: 4,
            child: CustomTitlePage(title: "titlePageOrderDetails"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: GetBuilder<OrderDetailsControllerImp>(
          builder: (controller) => HandlingDatatView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomStatusOrder(
                  status:
                      "${controller.printOrderStatus(listModel!.ordersStatus!)} ",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: CustomOrderid(orderId: "${listModel.ordersId}"),
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: const [
                        CustomTitleTabel(titleColumn: "titleColumnName"),
                        CustomTitleTabel(titleColumn: "titleColumnCount"),
                        CustomTitleTabel(titleColumn: "titleColumnPrice"),
                      ],
                    ),
                    ...List.generate(controller.data.length, (index) {
                      var listData = controller.data[index];
                      return TableRow(
                        children: [
                          CustomBodyTable(
                            value:
                                "${translateDatabase(listData['items_name_ar'], listData['items_name'])}",
                          ),
                          CustomBodyTable(value: "${listData['countitems']}"),
                          CustomBodyTable(
                            value: "${listData['itemsprice']} \$",
                          ),
                        ],
                      );
                    }),
                    TableRow(
                      children: [
                        CustomBodyTable(value: "bodyRowDelivery".tr),
                        Text(""),
                        CustomBodyTable(
                          value: "${listModel.ordersPriceDelivery} \$",
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 3,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.black,
                ),
                CustomTotalPriceOrder(
                  totalPrice: "${listModel.ordersTotalPrice}",
                ),
                const SizedBox(height: 10),
                CustomCardAddress(
                  name: " ${listModel.addressName}",
                  city: "${listModel.addressCity}",
                  street: "${listModel.addressStreet}",
                  phone: "${listModel.addressPhone}",
                ),
                const SizedBox(height: 10),
                CustomGoogleMap(
                  marker: controller.markers,
                  cameraPosition: controller.cameraPosition,
                  onMapCreated: (GoogleMapController controllerMap) {
                    controller.controllerMap.complete(controllerMap);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
