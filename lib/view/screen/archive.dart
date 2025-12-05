import 'package:e_commerce_app/controller/archive_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/middle_ware/order_model.dart';
import 'package:e_commerce_app/core/shared/custom_icon_back.dart';
import 'package:e_commerce_app/core/shared/custom_title_page.dart';
import 'package:e_commerce_app/core/shared/rating.dart';
import 'package:e_commerce_app/view/widget/order/custom_card_address.dart';
import 'package:e_commerce_app/view/widget/order/custom_orderId.dart';
import 'package:e_commerce_app/view/widget/order/custom_status_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderArchiveControllerImp());
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
            child: CustomTitlePage(title: "titlePgaeOrderArchive"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10.0),
        child: GetBuilder<OrderArchiveControllerImp>(
          builder: (controller) => HandlingDatatView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  CartOrderList(listData: controller.data[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class CartOrderList extends GetView<OrderArchiveControllerImp> {
  final OrdersModel listData;
  const CartOrderList({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(251, 221, 220, 220),
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
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
          if (listData.ordersRating == 0)
            Positioned(
              top: 0,
              left: controller.lang == "ar" ? 0 : null,
              right: controller.lang == "ar" ? null : 0,
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    showRating(context, listData.ordersId!);
                  },
                  child: Text(
                    "button".tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
