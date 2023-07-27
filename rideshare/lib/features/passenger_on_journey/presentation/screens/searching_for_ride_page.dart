import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rideshare/features/passenger_on_journey/presentation/screens/passenger_on_journey_page.dart';

import '../../domain/entities/user.dart';
import '../widget/cancel_button_modal.dart';
import '../widget/searching_page_modal_function.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/ride_offer.dart';
import '../bloc/ride_request_bloc/ride_request_bloc.dart';

class SearchingforRidePage extends StatelessWidget {
  SearchingforRidePage({super.key});
  User user = User(
      fullname: "Abebe Fekede",
      age: 20,
      imageUrl: "https://",
      phoneNumber: "0961088592");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            child: const Text("click"),
            onPressed: () {
              context.go('/rideCompletePassenger',
                  extra: {"totalCost": 64.23, "tip": 4.23});

              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return CancelRidePassengerModal();
              //     });

              // context.read<RideRequestBloc>().add(RideOfferEvent(RideOffer(
              //     user: user,
              //     currentLocation:
              //         Location(latitude: 9.0302, longitude: 38.7625),
              //     destination: Location(latitude: 9.03055, longitude: 38.7777),
              //     seatsAllocated: 3)));
            },
          ),
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
            } else if (state is RideRequestWaitingState) {
              showSearchDriverModal(context);
            } else if (state is RideRequestFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  dismissDirection: DismissDirection.horizontal,
                  content: Row(
                    children: [
                      Icon(Icons.warning),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'No internet connection',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          builder: (context, state) {
            return const SizedBox();
          },
        )
      ],
    ));
  }
}
