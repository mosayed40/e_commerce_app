import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

class CustomItemOnProductCart extends StatelessWidget {
  const CustomItemOnProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          5,
          (i) => Card(
            child: Row(
              children: [
                // image
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppImageAsset.avatar,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // title && price
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: Text("Laptop PHP"),
                    subtitle: Text("200.00 \$"),
                  ),
                ),
                //
                Expanded(child: Text("expanded $i")),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
