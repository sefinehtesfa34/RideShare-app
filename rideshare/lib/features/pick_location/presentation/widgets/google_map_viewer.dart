import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// GoogleMapViewer Widget
///
/// A widget that displays a Google Map with a marker at a specified latitude and longitude.
class GoogleMapViewer extends StatefulWidget {
  /// Constructs a GoogleMapViewer widget with the given latitude and longitude.
  const GoogleMapViewer({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  /// The latitude coordinate for the initial camera position.
  final double latitude;

  /// The longitude coordinate for the initial camera position.
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
        target: LatLng(widget.latitude, widget.longitude),
        zoom: 14.5,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {},
    );
  }
}
