import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/core/middle_ware/cart_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemOnProductCart extends StatelessWidget {
  final CartModel cartModel;
  const CustomItemOnProductCart({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    ControllerInCartImp controller = Get.put(ControllerInCartImp());
    return Card(
      child: Row(
        children: [
          // image
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: "${AppLinkApi.imagesItems}/${cartModel.itemsImage}",
                  width: 20,
                ),
              ),
            ),
          ),
          // title && price
          Expanded(
            flex: 5,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "${translateDatabase(cartModel.itemsNameAr, cartModel.itemsName)}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    "${cartModel.askPrice} \$",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text("Count:  ${cartModel.numberOfPieces}"),
                ],
              ),
            ),
          ),
          //delete
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                controller.deleteFromCart(cartModel.itemsId!);
                controller.refresData();
              },
              icon: Icon(Icons.delete, color: Colors.red[700]),
            ),
          ),
        ],
      ),
    );
  }
}
