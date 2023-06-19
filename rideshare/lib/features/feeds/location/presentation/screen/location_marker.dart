import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';

class CustomizeMarker extends StatefulWidget {
  const CustomizeMarker({
    super.key,
    required this.handleMarkerPositionChanged,
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;
  final Function(MapPosition) handleMarkerPositionChanged;
  @override
  State<CustomizeMarker> createState() => _CustomizeMarkerState();
}

class _CustomizeMarkerState extends State<CustomizeMarker> {
  LatLng _markerLocation = LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (BuildContext context, LocationState state) {},
      builder: (BuildContext context, LocationState state) {
        return FlutterMap(
          options: MapOptions(
            onPositionChanged: (MapPosition position, _) => {
              setState(() {
                _markerLocation = position.center!;
              }),
              widget.handleMarkerPositionChanged(position),
              context.read<LocationBloc>().add(SourceLocationChangedEvent(
                    sourceLatitude: position.center!.latitude,
                    sourceLongitude: position.center!.longitude,
                  ))
            },
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
            MarkerLayer(
              markers: <Marker>[
                Marker(
                  point: _markerLocation,
                  builder: (BuildContext context) => GestureDetector(
                      child: SvgPicture.asset('images/destination_picker.svg'),
                      onTap: () => {
                            debugPrint(_markerLocation.toString()),
                          }),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
