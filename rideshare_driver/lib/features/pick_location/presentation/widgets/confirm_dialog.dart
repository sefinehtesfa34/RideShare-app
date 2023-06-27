import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../pick_passengers/domain/entity/location.dart';
import '../../../pick_passengers/domain/entity/ride_request.dart';
import '../../../pick_passengers/presentation/bloc/fetch_passengers/fetch_passengers_bloc.dart';

import 'select_button.dart';

class SeatSelectionDialog extends StatefulWidget {
  final String source;
  final String destination;
  final LatLng sourceLocation;
  final LatLng destinationLocation;
  final int seatCount;
  final ValueChanged<int> onSeatCountChanged;
  final VoidCallback onConfirmPressed;

  const SeatSelectionDialog({
    super.key,
    required this.source,
    required this.destination,
    required this.seatCount,
    required this.onSeatCountChanged,
    required this.onConfirmPressed, required this.sourceLocation, required this.destinationLocation,
  });

  @override
  State<SeatSelectionDialog> createState() => _SeatSelectionDialogState();
}

class _SeatSelectionDialogState extends State<SeatSelectionDialog> {
  int currentSeatCount = 0;

  @override
  void initState() {
    super.initState();
    currentSeatCount = widget.seatCount;
  }

  void incrementSeatCount() {
    setState(() {
      currentSeatCount++;
    });
  }

  void decrementSeatCount() {
    setState(() {
      if (currentSeatCount > 0) {
        currentSeatCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Available Seats',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              fontSize: 19.sp,
              color: const Color(0xFF414141),
            ),
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/star_icon.jpg",
                  width: 4.w,
                ),
                SizedBox(width: 1.0.w),
                SizedBox(
                  width: 60.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Text(
                      widget.source,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 16.sp,
                        color: const Color(0xFF414141),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.0.h),
            Row(
              children: <Widget>[
                Image.asset("assets/images/location.png"),
                SizedBox(width: 1.0.h),
                SizedBox(
                  width: 60.w,
                  child: Text(
                    widget.destination,
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
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Seats: $currentSeatCount'),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: incrementSeatCount,
                        icon: const Icon(Icons.add),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints.tight(const Size(32, 32)),
                      ),
                      Container(
                        width: 1,
                        height: 32,
                        color: Colors.grey,
                      ),
                      IconButton(
                        onPressed: decrementSeatCount,
                        icon: const Icon(Icons.remove),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints.tight(const Size(32, 32)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          SelectButton(
            buttonName: 'Confirm',
            onPressed: () {

              //! here it should fetch the driver and car information from cache and send it
              final rideRequest = RideRequest(
                driverName: 'Bob',
                driverImageURL: 'https://example.com/bob.jpg',
                driverRatingAverageOutOf5: 4.5,
                driverReviews: 100,
                carModel: 'Toyota Camry',
                availableSeats: 3,
                carImageURL: 'https://example.com/camry.jpg',
                carPlateNumber: 'AB12 CDE',
                driverPhoneNumber: '+1 123-456-7890',
                carLocation: Location(latitude: widget.sourceLocation.latitude, longitude: widget.sourceLocation.longitude),
                passengersList: [],
                destination: Location(latitude: widget.destinationLocation.latitude, longitude: widget.destinationLocation.longitude),
              );
              
              context.go('/pickUpPassengers',
                  extra: {'rideRequest': rideRequest});
              BlocProvider.of<FetchPassengersBloc>(context)
                  .add(FetchAllPassengers());
            },
          ),
        ]);
  }
}
