
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/presentation/bloc/location_bloc.dart';

import '../../../../../core/map/map_box.dart';
import '../../../../../core/utils/colors.dart';

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
  bool backToInitialPos = false;
  bool turn = false;
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (BuildContext context, LocationState state) {},
      builder: (BuildContext context, LocationState state) {
        return Scaffold(
          body: FlutterMap(
            
            mapController: _mapController,
            nonRotatedChildren: [
              Positioned(
                top: 50.h,
                right: 0,
                child: FloatingActionButton(
                  onPressed: () async {
                    setState(() {
                      backToInitialPos = true;
                    });
                  },
                  child: const Icon(
                    Icons.my_location,
                    color: primaryColor,
                  ),
                ),
              ),
              Positioned(
                top: 40.h,
                right: 0,
                child: FloatingActionButton(
                  onPressed: () async {
                    setState(() {
                      turn = true;
                    });
                  },
                  child: const Icon(
                    Icons.rotate_90_degrees_ccw,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
            
            options: MapOptions(
              
              onPositionChanged: (MapPosition position, _) => {
                setState(() {
                  turn = false;
                  backToInitialPos = false;
                  _markerLocation = position.center!;
                }),
                widget.handleMarkerPositionChanged(position),
                context.read<LocationBloc>().add(SourceLocationChangedEvent(
                      sourceLatitude: position.center!.latitude,
                      sourceLongitude: position.center!.longitude,
                    ))
              },
              center: LatLng(0, 0),
              zoom: 16,
              minZoom: 0,
              maxZoom: 17,
            ),
            // ignore: always_specify_types
            children: [
              TileLayer(
                urlTemplate:
                    mapUrl,
                additionalOptions: {
                  'accessToken': accessToken,
                  'id': mapTypeId
                },
                userAgentPackageName:
                    'net.tlserver6y.flutter_map_location_marker.example',
              ),
              CurrentLocationLayer(
                turnOnHeadingUpdate: turn
                    ? TurnOnHeadingUpdate.always
                    : TurnOnHeadingUpdate.once,
                followOnLocationUpdate: backToInitialPos
                    ? FollowOnLocationUpdate.always
                    : FollowOnLocationUpdate.once,
                followAnimationCurve: Curves.easeInOut,
                followAnimationDuration: const Duration(milliseconds: 600),
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
                moveAnimationDuration:
                    const Duration(milliseconds: 600), // disable animation
              ),
              MarkerLayer(
                rotate: false,
                markers: <Marker>[
                  Marker(
                    rotate: false,
                    anchorPos: AnchorPos.align(AnchorAlign.center),
                    point: _markerLocation,
                    builder: (BuildContext context) => GestureDetector(
                        child: SvgPicture.asset(
                          'assets/images/destination_picker.svg',
                          width: 10.w,
                        ),
                        onTap: () => {
                              debugPrint(_markerLocation.toString()),
                            }),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
