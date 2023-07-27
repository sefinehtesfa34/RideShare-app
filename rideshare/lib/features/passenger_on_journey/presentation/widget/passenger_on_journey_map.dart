import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import "package:latlong2/latlong.dart" as lat_lng;
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

import '../../../../core/map/map_box.dart';
import '../../../../core/utils/colors.dart';

import 'package:mapbox_api/mapbox_api.dart';

import '../../../../core/utils/images.dart';

class OnJourneyMap extends StatefulWidget {
  OnJourneyMap(
      {required this.userLocation,
      required this.driverLocation,
      required this.destinationLocation});

  final lat_lng.LatLng userLocation;
  final lat_lng.LatLng driverLocation;
  final lat_lng.LatLng destinationLocation;

  @override
  State<OnJourneyMap> createState() => _OnJourneyMapState();
}

class _OnJourneyMapState extends State<OnJourneyMap> {
  List<lat_lng.LatLng> _route = [];

  @override
  void initState() {
    super.initState();
    getDirectionsResponse(widget.userLocation, widget.destinationLocation);
  }


  
  Future<void> getDirectionsResponse(
      lat_lng.LatLng startPosition, lat_lng.LatLng endPosition) async {
    final coordinates = <List<double>>[
      <double>[
        startPosition.latitude, // latitude
        startPosition.longitude, // longitude
      ],
      <double>[
        endPosition.latitude, // latitude
        endPosition.longitude, // longitude
      ],
    ];
    final response = await mapbox.directions.request(
        profile: NavigationProfile.DRIVING_TRAFFIC,
        overview: NavigationOverview.FULL,
        geometries: NavigationGeometries.GEOJSON,
        steps: true,
        coordinates: coordinates);
    final latLngList = <lat_lng.LatLng>[];

    try {
      final routes = response.routes;
      final shortestRoute = routes?.first;
      final geometry = shortestRoute!.geometry;

      // Convert geometry to list of LatLng
      for (final coord in geometry["coordinates"]) {
        latLngList.add(lat_lng.LatLng(coord[1], coord[0]));
      }
      setState(() {
        _route = latLngList;
      });

      // Do something with latLngList, such as displaying on a map etc.
    } catch (ex) {
      // Handle error
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: widget.userLocation,
        zoom: 13.5,
        minZoom: 0,
        maxZoom: 19,
      ),
      children: [
        TileLayer(
          urlTemplate: mapUrl,
          additionalOptions: {'accessToken': accessToken, 'id': mapTypeId},
          userAgentPackageName:
              'net.tlserver6y.flutter_map_location_marker.example',
          maxZoom: 19,
        ),
        CurrentLocationLayer(
          style: LocationMarkerStyle(
            marker: const DefaultLocationMarker(
              color: primaryColor,
              child: Icon(
                size: 20,
                Icons.person_pin,
                color: Colors.white,
              ),
            ),
            markerSize: const Size.square(30),
            accuracyCircleColor: primaryColor.withOpacity(0.1),
            headingSectorColor: primaryColor.withOpacity(0.8),
            headingSectorRadius: 60,
          ),
          moveAnimationDuration: Duration.zero, // disable animation
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: widget
                  .driverLocation, // replace with your latitude and longitude values
              builder: (context) =>
                  Container(child: Image(image: AssetImage(carImageIcon))),
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: widget
                  .destinationLocation, // replace with your latitude and longitude values
              builder: (context) => Container(
                  child: Image(image: AssetImage(destinationPinMarker))),
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: _route,
              color: primaryColor,
              strokeWidth: 4.0,
            ),
          ],
        ),
      ],
    );
  }
}
