import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:rideshare/utils/get_city.dart';
import '../widgets/back_button.dart';
import '../widgets/horizontal_line.dart';
import '../widgets/search_text_field.dart';
import '../widgets/select_button.dart';
import 'location_marker.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({Key? key}) : super(key: key);

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  final FocusNode _sourceFocusNode = FocusNode();
  final FocusNode _destinationFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 100.h,
            child: CustomizeMarker(
              handleMarkerPositionChanged: handleMarkerPositionChanged,
              latitude: 70.0,
              longitude: 40,
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            height: 40.h,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.sp),
                      topRight: Radius.circular(22.sp),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.sp, right: 19.sp),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 6.h),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                                'images/current_mocation_marker.svg'),
                            SizedBox(width: 1.w),
                            Expanded(
                              child: LocationTextField(
                                hintText: 'Enter source location',
                                controller: sourceController,
                                focusNode: _sourceFocusNode,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.0.h),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset('images/Subtract.svg'),
                            SizedBox(width: 1.w),
                            Expanded(
                              child: LocationTextField(
                                hintText: 'Enter destination location',
                                controller: destinationController,
                                focusNode: _destinationFocusNode,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.0.h),
                        SelectButton(
                          onPressed: _handleSelectButtonPressed,
                        ),
                      ],
                    ),
                  ),
                ),
                const HorizontalLine(),
              ],
            ),
          ),
          const Back(),
        ],
      ),
    );
  }

  void handleMarkerPositionChanged(MapPosition position) async {
    String location =
        await getCity(position.center!.latitude, position.center!.longitude);
    if (_sourceFocusNode.hasFocus) {
      sourceController.text = location;
    } else if (_destinationFocusNode.hasFocus) {
      destinationController.text = location;
    }
  }

  void _handleSelectButtonPressed() {
    final LocationBloc locationBloc = BlocProvider.of<LocationBloc>(context);

    if (_sourceFocusNode.hasFocus) {
      final String source = sourceController.text;
      locationBloc.add(SourceLocationChangedEvent(source: source));
    } else if (_destinationFocusNode.hasFocus) {
      final String destination = destinationController.text;
      locationBloc
          .add(DestinationLocationChangedEvent(destination: destination));
    }
  }
}
