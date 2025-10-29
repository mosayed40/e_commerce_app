import 'package:e_commerce_app/controller/pending_orders_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/middle_ware/pending_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text(" Check Out", style: TextStyle(color: Colors.grey)),
        centerTitle: true,
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
      onTap: () {},
      child: Card(
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
              Text("Order Price :  ${listData.ordersPrice}\$"),
              Text("Price Delivery :  ${listData.ordersPriceDelivery}\$"),
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
    );
  }
}
