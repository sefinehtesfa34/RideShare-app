import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rideshare/features/passenger/presentation/screens/passenger_on_journey_page.dart';

import '../../domain/entities/location.dart';
import '../../domain/entities/passenger.dart';
import '../bloc/ride_request_bloc/ride_request_bloc.dart';

class SearchingforRidePage extends StatelessWidget {
  const SearchingforRidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            child: Text("click"),
            onPressed: () {
              context.read<RideRequestBloc>().add(RideOfferEvent(Passenger(
                  imageUrl: "",
                  name: "",
                  currentLocation:
                      Location(latitude: 9.0302, longitude: 38.7625),
                  destination: Location(latitude: 9.03055, longitude: 38.7777),
                  seatsAllocated: 3)));
            },
          ),
        ),
        BlocConsumer<RideRequestBloc, RideRequestState>(
          listener: (context, state) {
            if (state is RideRequestSuccessState) {
              final Passenger passenger = Passenger(
                            imageUrl: "",
                            name: "",
                            currentLocation:
                                Location(latitude: 9.0302, longitude: 38.7625),
                            destination:
                                Location(latitude: 9.03055, longitude: 38.7777),
                            seatsAllocated: 3,
                          );

              String encodedPassenger = jsonEncode(passenger.toJson());

              context.go('/onJourney',
                  extra: {'passenger': passenger});
              
              
            }
          },
          builder: (context, state) {
            if (state is RideRequestSuccessState) {
              // render widgets with updated rideRequest data here
              return Text("streaming");
            } else if (state is RideRequestFailureState) {
              // handle errors here
              return Center(child: const Text('Error occurred:'));
            } else {
              // handle initial and loading states here
              return CircularProgressIndicator();
            }
          },
        )
      ],
    ));
  }
}
