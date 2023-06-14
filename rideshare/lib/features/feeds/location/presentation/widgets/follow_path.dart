import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationMap extends StatelessWidget {
  final double currentLatitude;
  final double currentLongitude;
  final double destinationLatitude;
  final double destinationLongitude;

  const LocationMap({
    required this.currentLatitude,
    required this.currentLongitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(currentLatitude, currentLongitude),
        zoom: 12.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 30.0,
              height: 30.0,
              point: LatLng(currentLatitude, currentLongitude),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 30.0,
                ),
              ),
            ),
            Marker(
              width: 30.0,
              height: 30.0,
              point: LatLng(destinationLatitude, destinationLongitude),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [
                LatLng(currentLatitude, currentLongitude),
                LatLng(destinationLatitude, destinationLongitude),
              ],
              color: Colors.green,
              strokeWidth: 2.0,
            ),
          ],
        ),
      ],
    );
  }
}



// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
// import 'package:latlong2/latlong.dart';

// class AnimationDebugger extends StatefulWidget {
//   @override
//   State<AnimationDebugger> createState() => _AnimationDebuggerState();
// }

// class _AnimationDebuggerState extends State<AnimationDebugger> {
//   LocationMarkerPosition _locationMarkerPosition = LocationMarkerPosition(
//     latitude: 0,
//     longitude: 0,
//     accuracy: 20000,
//   );
//   LocationMarkerHeading _locationMarkerHeading = LocationMarkerHeading(
//     heading: 0,
//     accuracy: 1,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Animation Debugger'),
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           center:  LatLng(0, 0),
//           zoom: 8,
//           minZoom: 0,
//           maxZoom: 19,
//         ),
//         nonRotatedChildren: [
//           Positioned(
//             right: 20,
//             bottom: 20,
//             child: Column(
//               children: [
//                 FloatingActionButton(
//                   onPressed: () {
//                     final random = Random();
//                     setState(() {
//                       _locationMarkerPosition = LocationMarkerPosition(
//                         latitude: random.nextDouble() - 0.5,
//                         longitude: random.nextDouble() - 0.5,
//                         accuracy: random.nextDouble() * 80000 + 20000,
//                       );
//                     });
//                   },
//                   heroTag: null,
//                   child: const Icon(
//                     Icons.my_location,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 FloatingActionButton(
//                   onPressed: () {
//                     final random = Random();
//                     setState(() {
//                       _locationMarkerHeading = LocationMarkerHeading(
//                         heading: random.nextDouble() * pi * 2,
//                         accuracy: random.nextDouble() * 0.8 + 0.2,
//                       );
//                     });
//                   },
//                   heroTag: null,
//                   child: const Icon(
//                     Icons.navigation,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//         children: [
//           TileLayer(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: const ['a', 'b', 'c'],
//             userAgentPackageName:
//                 'net.tlserver6y.flutter_map_location_marker.example',
//             maxZoom: 19,
//           ),
//           AnimatedLocationMarkerLayer(
//             position: _locationMarkerPosition,
//             heading: _locationMarkerHeading,
//             moveAnimationDuration: const Duration(seconds: 2),
//           ),
//         ],
//       ),
//     );
//   }
// }