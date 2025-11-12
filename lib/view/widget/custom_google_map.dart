import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatelessWidget {
  final List<Marker> marker;
  final CameraPosition? cameraPosition;
  final Function(GoogleMapController)? onMapCreated;

  const CustomGoogleMap({
    super.key,
    required this.marker,
    required this.cameraPosition,
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        markers: marker.toSet(),
        initialCameraPosition: cameraPosition!,
        onMapCreated: onMapCreated,
      ),
    );
  }
}
