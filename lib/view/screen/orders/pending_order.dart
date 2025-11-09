import 'package:e_commerce_app/controller/orders/pending_orders_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/middle_ware/order_model.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImp());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        actions: [
          CustomIconBack(),
          Expanded(flex: 4, child: CustomTitlePage(title: "Check Out")),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10.0),
        child: GetBuilder<OrderControllerImp>(
          builder: (controller) => HandlingDatatView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  CardOrder(listData: controller.data[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class CardOrder extends GetView<OrderControllerImp> {
  final OrdersModel listData;

  const CardOrder({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToOrderDetails(listData);
      },
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Number :  ${listData.ordersId} ",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  Divider(),
                  Text("Total Price :  ${listData.ordersTotalPrice}\$"),
                  Text("Payment Method :  ${listData.ordersPaymentMethod}"),
                  Container(
                    color: const Color(0xFF8B07FF),
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                    child: Text(
                      "Order Status :  ${controller.printOrderStatus(listData.ordersStatus!)}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: IconButton(
              onPressed: () {
                controller.deleteOrder(listData.ordersId!);
              },
              icon: Icon(Icons.delete, size: 28, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
