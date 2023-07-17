import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../pick_passengers/domain/entity/ride_offer.dart';

class GoogleMapViewer extends StatefulWidget {
  const GoogleMapViewer({
    super.key,
    required this.source,
    required this.destination,
    required this.passengers,
  });
  final LatLng source;
  final LatLng destination;
  final List<RideOffer> passengers;
  @override
  State<GoogleMapViewer> createState() => _GoogleMapViewerState();
}

class _GoogleMapViewerState extends State<GoogleMapViewer> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  late BitmapDescriptor passengersIcon;

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/car_icon.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/destination_pin_marker.png');
    passengersIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        "assets/images/location.png");
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      polylines: _polylines,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          9.030098,
          38.762868,
        ),
        zoom: 14.5,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        setMapPins();
        setPolylines();
        addMarkers();
      },
      markers: _markers,
    );
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: const MarkerId('sourcePin'),
          position: widget.source,
          icon: sourceIcon));
      // destination pin
      _markers.add(Marker(
          markerId: const MarkerId('destPin'),
          position: widget.destination,
          icon: destinationIcon));
    });
  }

  setPolylines() async {
    PointLatLng source = PointLatLng(
      widget.source.latitude,
      widget.source.longitude,
    );
    PointLatLng destination = PointLatLng(
      widget.destination.latitude,
      widget.destination.longitude,
    );

    PolylineResult? result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCxqriQbYf-UMvPX2vfrvtNYzOvB8Jn_t8",
      source,
      destination,
    );

    if (result.errorMessage!.isEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId('poly'),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  void addMarkers() {
    int count = 1;
    for (var element in widget.passengers) {
      setState(() {
        _markers.add(Marker(
          markerId: MarkerId(count.toString()),
          position: LatLng(
            element.currentLocation.latitude,
            element.currentLocation.longitude,
          ),
          icon: passengersIcon,
        ));
      });
      count++;
    }
  }
}
