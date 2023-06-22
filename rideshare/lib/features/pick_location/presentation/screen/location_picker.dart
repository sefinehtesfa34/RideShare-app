import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'dart:async';

import 'package:rideshare/features/pick_location/presentation/widgets/google_map_viewer.dart';

import '../widgets/choose_location.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: 'AIzaSyCxqriQbYf-UMvPX2vfrvtNYzOvB8Jn_t8');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMapViewer(),
        // Positioned(
        //   child: Container(
        //     child: SearchDestinationPage(
        //       places: _places,
        //     ),
        //   ),
        // )
      ],
    ));
  }
}
