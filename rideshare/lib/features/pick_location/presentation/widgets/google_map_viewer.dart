import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapViewer extends StatefulWidget {
  const GoogleMapViewer({super.key});

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
      mapToolbarEnabled: true,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.7749, -122.4194),
        zoom: 12,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        const Marker(
          markerId: MarkerId('myMarker'),
          position: LatLng(37.7749, -122.4194),
          infoWindow: InfoWindow(
            title: 'My Marker',
            snippet: 'This is my marker',
          ),
        )
      },
    );
  }
}
