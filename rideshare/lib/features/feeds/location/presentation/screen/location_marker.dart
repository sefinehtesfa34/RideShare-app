import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomizeMarker extends StatelessWidget {
  const CustomizeMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(0, 0),
        zoom: 1.sp,
        minZoom: 0.sp,
        maxZoom: 19.sp,
      ),
      // ignore: always_specify_types
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          // ignore: always_specify_types
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName:
              'net.tlserver6y.flutter_map_location_marker.example',
          // maxZoom: 19.sp,
        ),
        CurrentLocationLayer(
          style: LocationMarkerStyle(
            marker: DefaultLocationMarker(
                // color: Colors.white,
                child: SvgPicture.asset('images/destination_picker.svg')),
            markerSize: Size.square(20.sp),
            accuracyCircleColor: Colors.green.withOpacity(0.1.sp),
            headingSectorColor: Colors.green.withOpacity(0.8.sp),
            headingSectorRadius: 120.h,
          ),
          moveAnimationDuration: Duration.zero, // disable animation
        ),
      ],
    );
  }
}
