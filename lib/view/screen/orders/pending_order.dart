import 'package:e_commerce_app/controller/orders/pending_orders_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/middle_ware/order_model.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/view/widget/order/custom_card_address.dart';
import 'package:e_commerce_app/view/widget/order/custom_orderId.dart';
import 'package:e_commerce_app/view/widget/order/custom_status_order.dart';
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
          Expanded(flex: 4, child: CustomTitlePage(title: "titlePageMyOrders")),
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
                  CustomOrderid(orderId: "${listData.ordersId}"),
                  Divider(),
                  CustomTextAddress(
                    title: "totalPrice",
                    body: " ${listData.ordersTotalPrice} \$",
                  ),
                  CustomTextAddress(
                    title: "paymentMethod",
                    body: "${listData.ordersPaymentMethod}",
                  ),
                  CustomStatusOrder(
                    status:
                        " ${controller.printOrderStatus(listData.ordersStatus!)}",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: controller.lang == "en" ? 10 : null,
            left: controller.lang == "ar" ? 10 : null,
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
