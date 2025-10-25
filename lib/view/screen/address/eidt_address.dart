import 'package:e_commerce_app/controller/address/edit_address_controller.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/valid_input_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerEditAddressImp());

    return GetBuilder<ControllerEditAddressImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("تعديل العنوان"),
          centerTitle: true,
          backgroundColor: const Color(0xFF3199EE),
        ),
        body: controller.statusRequest == StatusRequest.loading
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: controller.editAddressFormState,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        labelText: "الاسم",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                          validInputAddress(val!, 2, 30, "UserName"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: controller.phone,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "رقم الهاتف",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                          validInputAddress(val!, 8, 20, "Phone"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: controller.city,
                      decoration: const InputDecoration(
                        labelText: "المدينة",
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                          validInputAddress(val!, 2, 30, "City"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: controller.street,
                      decoration: const InputDecoration(
                        labelText: "الشارع",
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                          validInputAddress(val!, 2, 30, "Street"),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.editAddress();
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text("حفظ التعديلات"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFF3199EE),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
