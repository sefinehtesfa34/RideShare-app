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
  int seatCount = 0;
  final FocusNode _sourceFocusNode = FocusNode();
  final FocusNode _destinationFocusNode = FocusNode();
  MapPosition _Sourcelocation = MapPosition();
  MapPosition _destinationLocation = MapPosition();
  late final LocationBloc _locationBloc = BlocProvider.of(context);
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
    if (_sourceFocusNode.hasFocus) {
      setState(() {
        _Sourcelocation = position;
      });
    } else if (_destinationFocusNode.hasFocus) {
      setState(() {
        _destinationLocation = position;
      });
    }
  }

  void _handleSelectButtonPressed() async {
    final String source = sourceController.text;
    final String destination = destinationController.text;
    updateLocation();
    if (source.isNotEmpty && destination.isNotEmpty) {
      _locationBloc
          .add(SelectLocationEvent(source: source, destination: destination));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Center(
                child: AlertDialog(
                  backgroundColor: const Color(0xFFFFFFFF),
                  title: Text(
                    'Select Number of Seat \n and Confirm Price',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16.sp,
                      color: const Color(0xFF414141),
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'images/current_mocation_marker.svg'),
                          SizedBox(width: 1.0.w),
                          SizedBox(
                            width: 30.w,
                            child: Text(
                              source,
                              softWrap: true,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 16.sp,
                                color: const Color(0xFF414141),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0.h),
                      Row(
                        children: [
                          SvgPicture.asset('/images/Subtract.svg'),
                          SizedBox(width: 1.0.h),
                          SizedBox(
                            width: 30.w,
                            child: Text(
                              destination,
                              softWrap: true,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 16.sp,
                                color: const Color(0xFF414141),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total Price you will pay: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              color: const Color(0xFF414141),
                            ),
                          ),
                          Text(
                            "Br 60 ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              color: const Color(0xFF414141),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Seats: $seatCount'),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      ++seatCount;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  padding: EdgeInsets.zero,
                                  constraints:
                                      BoxConstraints.tight(const Size(32, 32)),
                                ),
                                Container(
                                  width: 1,
                                  height: 32,
                                  color: Colors.grey,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      --seatCount;
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                  padding: EdgeInsets.zero,
                                  constraints:
                                      BoxConstraints.tight(const Size(32, 32)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle the confirm button press
                        // Do something with the selected source and destination locations
                        _locationBloc.add(SubmitLocationEvent());
                        Navigator.of(context).pop();
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
  }

  void updateLocation() async {
    sourceController.text = await getCity(
        _Sourcelocation.center!.latitude, _Sourcelocation.center!.longitude);
    _locationBloc
        .add(SourceLocationChangedEvent(source: sourceController.text));
    destinationController.text = await getCity(
        _destinationLocation.center!.latitude,
        _destinationLocation.center!.longitude);
    _locationBloc.add(DestinationLocationChangedEvent(
        destination: destinationController.text));
  }
}
