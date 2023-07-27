import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/presentation/widgets/select_button.dart';
import 'package:rideshare/features/pick_location/presentation/bloc/passenger_home_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../../../passenger_on_journey/domain/entities/location.dart';
import '../../../passenger_on_journey/domain/entities/ride_offer.dart';
import '../../../passenger_on_journey/domain/entities/user.dart';
import '../../../passenger_on_journey/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';
import '../../../passenger_on_journey/presentation/widget/searching_page_modal_function.dart';

class SeatSelectionDialog extends StatefulWidget {
  final String source;
  final String destination;
  final int seatCount;
  final ValueChanged<int> onSeatCountChanged;
  final VoidCallback onConfirmPressed;

  const SeatSelectionDialog({
    super.key,
    required this.source,
    required this.destination,
    required this.seatCount,
    required this.onSeatCountChanged,
    required this.onConfirmPressed,
  });

  @override
  State<SeatSelectionDialog> createState() => _SeatSelectionDialogState();
}

class _SeatSelectionDialogState extends State<SeatSelectionDialog> {
  int currentSeatCount = 0;
  double cost = 50;
  int amount = 50;
  User user = User(
      fullname: "Abebe Fekede",
      age: 20,
      imageUrl: "https://",
      phoneNumber: "0961088592");

  @override
  void initState() {
    super.initState();
    currentSeatCount = widget.seatCount;
  }

  void incrementSeatCount() {
    setState(() {
      currentSeatCount++;
      cost += amount;
    });
  }

  void decrementSeatCount() {
    setState(() {
      if (currentSeatCount > 0) {
        currentSeatCount--;
        cost -= amount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          'Select Number of Seats',
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
          Row(
            children: <Widget>[
              SvgPicture.asset('assets/images/current_mocation_marker.svg'),
              SizedBox(width: 1.0.w),
              SizedBox(
                width: 60.w,
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
            ],
          ),
          SizedBox(height: 2.0.h),
          Row(
            children: <Widget>[
              SvgPicture.asset('assets/images/Subtract.svg'),
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
            height: 2.h,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text(
          //       "Total Price you will pay: ",
          //       style: TextStyle(
          //         fontWeight: FontWeight.w500,
          //         fontFamily: 'Poppins',
          //         fontSize: 14.sp,
          //         color: const Color(0xFF414141),
          //       ),
          //     ),
          //     Text(
          //       "Br $cost ",
          //       style: TextStyle(
          //         fontWeight: FontWeight.w500,
          //         fontFamily: 'Poppins',
          //         fontSize: 16.sp,
          //         color: const Color(0xFF414141),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 1.h),
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
                      constraints: BoxConstraints.tight(Size(5.w, 5.h)),
                    ),
                    Container(
                      width: 1,
                      height: 4.h,
                      color: Colors.grey,
                    ),
                    IconButton(
                      onPressed: decrementSeatCount,
                      icon: const Icon(Icons.remove),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(Size(5.w, 5.h)),
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
            final ChooseLocationsBloc bloc =
                BlocProvider.of<ChooseLocationsBloc>(context, listen: false);
            final ChooseLocationsState state = bloc.state;
            if (state is ChooseLocationsSucess) {
              context.read<RideRequestBloc>().add(
                    RideOfferEvent(
                      RideOffer(
                          user: user,
                          currentLocation: Location(
                              latitude: state.soureLocation.latitude,
                              longitude: state.soureLocation.longitude),
                          destination: Location(
                              latitude: state.destinationLocation.latitude,
                              longitude: state.destinationLocation.longitude),
                          seatsAllocated: currentSeatCount,
                          price: cost,
                          accepted: false,
                          originAddress: '',
                          destinationAddress: '',
                          status: '2',
                          rideOfferId: '1'),
                    ),
                  );
            }
          },
        ),
        BlocConsumer<RideRequestBloc, RideRequestState>(
          listener: (context, state) {
            if (state is RideRequestSuccessState) {
              final RideOffer passenger = RideOffer(
                  user: user,
                  currentLocation:
                      Location(latitude: 9.0302, longitude: 38.7625),
                  destination: Location(latitude: 9.03055, longitude: 38.7777),
                  seatsAllocated: 3,
                  price: 60,
                  accepted: false,
                  originAddress: '',
                  destinationAddress: '',
                  status: '',
                  rideOfferId: '');

              context.go('/onJourney', extra: {'passenger': passenger});
            } else if (state is RideRequestFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  dismissDirection: DismissDirection.horizontal,
                  content: Row(
                    children: [
                      Icon(Icons.face),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Text(
                            "We couldn't find any driver arround. Please try again later.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Poppins", fontSize: 16.sp,color:Colors.black)),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.amber,
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            if (state is RideRequestWaitingState) {
              return Padding(
                padding: EdgeInsets.all(3.h),
                child: SpinKitThreeBounce(
                  color: primaryColor,
                  size: 5.h,
                ),
              );
              
            }
            return const SizedBox();
          },
        )
      ],
    );
  }
}
