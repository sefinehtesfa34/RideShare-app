import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GoogleMapViewer extends StatefulWidget {
  const GoogleMapViewer(
      {super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  @override
  State<GoogleMapViewer> createState() => _GoogleMapViewerState();
}

class _GoogleMapViewerState extends State<GoogleMapViewer> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      // padding: EdgeInsets.only(top: 40.0.h),
      initialCameraPosition: CameraPosition(
        target: LatLng(9.030098, 38.762868),
        zoom: 14.5,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {},
    );
  }
}
