import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/location/location.dart';
import '../../../../core/utils/colors.dart';
import '../../domain/entities/passenger.dart';
import '../../domain/entities/ride_request.dart';
import '../bloc/ride_request_bloc/ride_request_bloc.dart';
import '../widget/back_button_custom_icon.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/passenger_on_journey_map.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import "package:latlong2/latlong.dart" as lat_lng;

class PassengerOnJourneyPage extends StatelessWidget {
  final Passenger passenger;

  const PassengerOnJourneyPage({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RideRequestBloc, RideRequestState>(
      listener: (context, state) {/* handle state changes here */},
      builder: (context, state) {
        if (state is RideRequestSuccessState) {
          return StreamBuilder(
              stream: state.stream,
              builder:
                  (BuildContext context, AsyncSnapshot<RideRequest> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(child: Text('No stream data'));

                    case ConnectionState.waiting:
                      final data = snapshot.data;
                      return Center(child: Text('Waiting for data: $data'));

                    case ConnectionState.active:
                      debugPrint("I have been active watchu syaing");
                      return bottomSheetHolder(snapshot);

                    case ConnectionState.done:
                      return const Center(
                        child: Text("Finished fetching"),
                      );
                  }
                }
              });

          // render widgets with updated rideRequest data here
        } else if (state is RideRequestFailureState) {
          final errorMessage = state.message;
          // handle errors here
          return Center(child: Text('Error occurred: $errorMessage'));
        } else {
          // handle initial and loading states here
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget bottomSheetHolder(AsyncSnapshot<RideRequest> snapshot) {
    return Scaffold(
      body: Stack(children: [
        OnJourneyMap(
            userLocation: LatLng(passenger.currentLocation.latitude,
                passenger.currentLocation.longitude),
            driverLocation: LatLng(snapshot.data!.carLocation.latitude,
                snapshot.data!.carLocation.latitude),
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
                    driverLocation: LatLng(snapshot.data!.carLocation.latitude,
                        snapshot.data!.carLocation.latitude),
                    destinationLocation: LatLng(passenger.destination.latitude,
                        passenger.destination.longitude),
                    carModel: 'Toyota Executive 2000',
                    seatsAvailable: 2,
                    driverImageURL:
                        'https://img.freepik.com/premium-photo/happy-young-male-driver-wheel_136930-4.jpg',
                    driverName: 'Driver Name',
                    driverRating: 4.9,
                    driverReviews: 531,
                    carImageURL:
                        'https://thumbs.dreamstime.com/b/range-rover-black-matte-standing-street-florida-usa-174728616.jpg',
                    carPlateNumber: 'ABC-123',
                  );
                },
                childCount: 1,
              );
            }),
      ]),
    );
  }
}
