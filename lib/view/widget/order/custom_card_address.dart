import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomCardAddress extends StatelessWidget {
  final String name;
  final String city;
  final String street;
  final String phone;
  const CustomCardAddress({
    super.key,
    required this.name,
    required this.city,
    required this.street,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextAddress(title: "AddressLocation", body: name),
            CustomTextAddress(title: "phoneNumber", body: phone),
            CustomTextAddress(title: "addressCity", body: city),
            CustomTextAddress(title: "addressStreet", body: street),
          ],
        ),
      ),
    );
  }
}

class CustomTextAddress extends StatelessWidget {
  final String title;
  final String body;
  const CustomTextAddress({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title.tr, style: TextStyle(color: Colors.blueGrey)),
        Text(" :  "),
        Text(body.tr),
      ],
    );
  }
}
