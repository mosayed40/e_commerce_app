import 'package:e_commerce_app/controller/address/add_address_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/functions/valid_input_address.dart';
import 'package:e_commerce_app/view/widget/address/custom_text_form.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerAddAddressImp());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        actions: [
          CustomIconBack(),
          SizedBox(width: 20),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              "Add Addresses",
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: GetBuilder<ControllerAddAddressImp>(
        builder: (controller) => HandlingDatatRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            alignment: Alignment.center,
            child: Form(
              key: controller.addressFormState,
              child: ListView(
                children: [
                  CustomTextForm(
                    controller: controller.name,
                    labelText: "Name",
                    hintText: " user name",
                    valid: (val) {
                      return validInputAddress(val!, 6, 50, "UserName");
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
                  const SizedBox(height: 30),
                  CustomButtonAuth(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
