import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/location/location.dart';
import '../../../../core/utils/colors.dart';
// import '../../../feeds/presentation/widgets/confirm_dialog.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../bloc/ride_request_bloc/ride_request_bloc.dart';
import '../widget/back_button_custom_icon.dart';
import '../widget/border_only_button.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/passenger_on_journey_map.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import "package:latlong2/latlong.dart" as lat_lng;

class PassengerOnJourneyPage extends StatelessWidget {
  final RideOffer passenger;

  const PassengerOnJourneyPage({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RideRequestBloc, RideRequestState>(
        listener: (_, state) {/* handle state changes here */},
        builder: (_, state) {
          if (state is RideRequestSuccessState) {
            return StreamBuilder(
                stream: state.stream,
                builder: (BuildContext _, AsyncSnapshot<RideRequest> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(child: Text('No stream data'));

                      case ConnectionState.waiting:
                        return WaitingWidget(context);

                      case ConnectionState.active:
                        return bottomSheetHolder(snapshot);

                      case ConnectionState.done:
                        Future.delayed(Duration.zero, () {
                          context.go("/rideCompletePassenger", extra: {
                            "totalCost": 60.0,
                            "tip": 0.0
                          }); //! redirect to payed page.
                        });

                        return const SizedBox();
                    }
                    // if (!snapshot.hasData) {
                    //   return Scaffold(
                    //     body: Center(
                    //       child: CircularProgressIndicator(),
                    //     ),
                    //   );
                    // } else if (snapshot.connectionState == ConnectionState.active) {
                    //

                    //       debugPrint("I have been active watchu syaing");
                    //       return bottomSheetHolder(snapshot);

                    //     case ConnectionState.done:
                    //       Future.delayed(Duration.zero, () {
                    //         context.go("/home");
                  }
                });

            // render widgets with updated rideRequest data here
          } else if (state is RideRequestFailureState) {
            final errorMessage = state.message;
            // handle errors here
            return Center(child: Text('Error occurred: $errorMessage'));
          } else {
            // handle initial and loading states here
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget bottomSheetHolder(AsyncSnapshot<RideRequest> snapshot) {
    return SizedBox(
      child: Stack(children: [
        OnJourneyMap(
            userLocation: LatLng(passenger.currentLocation.latitude,
                passenger.currentLocation.longitude),
            driverLocation: LatLng(snapshot.data!.carLocation.latitude,
                snapshot.data!.carLocation.longitude),
            destinationLocation: LatLng(passenger.destination.latitude,
                passenger.destination.longitude)),
        Positioned(child: BackButtonCustomIcon(), top: 5.h, left: 3.w),
        FlexibleBottomSheet(
            // bottomSheetColor: white,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            minHeight: 0.3,
            maxHeight: 0.7,
            initHeight: 0.4,
            bodyBuilder: (context, index) {
              return SliverChildBuilderDelegate(
                (context, index) {
                  return CustomBottomSheet(
                    passenger: passenger,
                    driverLocation: LatLng(snapshot.data!.carLocation.latitude,
                        snapshot.data!.carLocation.latitude),
                    destinationLocation: LatLng(passenger.destination.latitude,
                        passenger.destination.longitude),
                    carModel: snapshot.data!.carModel,
                    seatsAvailable: snapshot.data!.availableSeats,
                    driverImageURL: snapshot.data!.driverImageURL,
                    driverName: snapshot.data!.driverName,
                    driverRating: snapshot.data!.driverRatingAverageOutOf5,
                    carImageURL: snapshot.data!.carImageURL,
                    carPlateNumber: snapshot.data!.carPlateNumber,
                    passengersList: snapshot.data!.passengersList,
                    driverPhoneNumber: snapshot.data!.driverPhoneNumber,
                  );
                },
                childCount: 1,
              );
            }),
      ]),
    );
  }

  WaitingWidget(BuildContext context) {
    return Column(
      mainAxisAlignment : MainAxisAlignment.center,
      children: [
      
        SvgPicture.asset(
          "assets/images/searching_svg.svg",
          height: 30.h,
          width: 40.w,
        ),
        SizedBox(height: 5.h),
        Text(
          'Searching for Driver',
          style: TextStyle(fontSize: 20.sp),
        ),
        SizedBox(height: 5.h),
        SpinKitThreeBounce(
          color: primaryColor,
          size: 5.h,
        ),
        SizedBox(height: 5.h),
        BorderOnlyButton(
          buttonText: "Cancel",
          color: Colors.red,
          onPressed: () {


            context.go('/passengerHome');
          },
        ),
      ],
    );
  }
}
