// import 'package:e_commerce_app/controller/address_controller.dart';
// import 'package:get/get.dart';
// import 'package:e_commerce_app/core/constant/colors.dart';
// import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
// import 'package:flutter/material.dart';

// class ViewAddress extends StatelessWidget {
//   const ViewAddress({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ControllerInAddressImp controller = Get.put(ControllerInAddressImp());
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actionsPadding: EdgeInsets.symmetric(horizontal: 15),
//         actions: [
//           CustomIconBack(),
//           SizedBox(width: 30),
//           Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.symmetric(horizontal: 50),
//             child: Text(
//               "View Addresses",
//               style: TextStyle(color: Colors.grey[600], fontSize: 30),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.buttonColor,
//         onPressed: () {},
//         child: Icon(Icons.add, color: Colors.white, size: 30),
//       ),
//       body: ListView(
//         children: [
//           Center(
//             child: Text(
//               "${controller.addressModel?.addressName ?? "لا يوجد اسم"}",
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:e_commerce_app/controller/address/address_controller.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/widget/custom_icon_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerInAddressImp());

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
              "View Addresses",
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonColor,
        onPressed: () {
          Get.toNamed(AppRoute.mapDemo);
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      //
      body: GetBuilder<ControllerInAddressImp>(
        builder: (controller) {
          // 🔹 الحالة الأولى: تحميل البيانات
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 🔹 الحالة الثانية: فشل أو لا توجد بيانات
          if (controller.data.isEmpty) {
            return const Center(
              child: Text(
                "لا يوجد عناوين حالياً",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          // 🔹 الحالة الثالثة: عرض البيانات
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              final address = controller.data[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(
                    address.addressName ?? "بدون اسم",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${address.addressPhone}"),
                      Text(
                        "${address.addressCity ?? ''} - ${address.addressStreet ?? ''}",
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      controller.deleteAddress(address.addressId!);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
