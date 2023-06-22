import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as lat_lng;
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

import '../../../../core/utils/colors.dart';

class CurrentLocationMap extends StatelessWidget {
  const CurrentLocationMap({super.key});
  final String mapUrl = 'https://api.mapbox.com/styles/v1/natnael-tadele/cliu6ltsm00tf01qv7ml277v8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibmF0bmFlbC10YWRlbGUiLCJhIjoiY2xpdTFxajY5MGVhdjNubXk2ZGpwZzkxNyJ9.kItia4BZW9XJVtTw2N-m9A';
  final String accessToken = 'pk.eyJ1IjoibmF0bmFlbC10YWRlbGUiLCJhIjoiY2xpdTFxajY5MGVhdjNubXk2ZGpwZzkxNyJ9.kItia4BZW9XJVtTw2N-m9A';
  final String mapTypeId = 'mapbox.mapbox-streets-v8';


  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: lat_lng.LatLng(9.016414, 38.782633),
        zoom: 14,
        minZoom: 0,
        maxZoom: 19,
      ),
      children: [
        TileLayer(
          urlTemplate: mapUrl,
          additionalOptions: {
            'accessToken': accessToken,
            'id' : mapTypeId
          }, 
          userAgentPackageName:
              'net.tlserver6y.flutter_map_location_marker.example',
          maxZoom: 19,
        ),
        CurrentLocationLayer(
          style: LocationMarkerStyle(
            marker: const DefaultLocationMarker(
              color: primaryColor,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            markerSize: const Size.square(40),
            accuracyCircleColor: primaryColor.withOpacity(0.1),
            headingSectorColor: primaryColor.withOpacity(0.8),
            headingSectorRadius: 60,
          ),
          moveAnimationDuration: Duration.zero, // disable animation
        ),
      ],
    );
  }
}