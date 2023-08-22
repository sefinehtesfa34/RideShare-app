import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:rideshare/features/pick_location/domain/entities/location.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_offer.dart';
import 'package:rideshare/features/pick_location/domain/entities/user.dart';
import 'package:rideshare/features/pick_location/domain/usecases/ride_request_usecase.dart';
import 'package:rideshare/features/pick_location/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';

import 'ride_request_bloc_test.mocks.dart';

@GenerateMocks([GetRideRequestUseCase])
void main() {
  group('RideRequestBloc', () {
    late RideRequestBloc rideRequestBloc;
    late GetRideRequestUseCase getRideRequestUseCase;

    setUp(() {
      getRideRequestUseCase = MockGetRideRequestUseCase();
      rideRequestBloc = RideRequestBloc(getRideRequestUseCase);
    });

    test('initial state is RideRequestInitial', () {
      expect(rideRequestBloc.state, RideRequestInitial());
    });

    test(
      'emits [RideRequestWaitingState, RideRequestSuccessState] when RideOfferEvent is added',
      () async {
        final expected = [
          RideRequestWaitingState(),
          RideRequestSuccessState(Stream.empty()),
        ];
        expectLater(rideRequestBloc.stream, emitsInOrder(expected));
        rideRequestBloc.add(RideOfferEvent(RideOffer(
          user: User(
            fullname: 'John Doe', // provide the full name
            imageUrl:
                'https://example.com/profile.jpg', // provide the image URL
            phoneNumber: '+1234567890', // provide the phone number
            age: 25, // provide the age
          ),
          currentLocation: Location(
            latitude: 37.7749, // provide the latitude
            longitude: -122.4194, // provide the longitude
          ),
          destination: Location(
            latitude: 34.0522, // provide the latitude
            longitude: -118.2437, // provide the longitude
          ),
          seatsAllocated: 2, // provide the number of seats allocated
          price: 10.0, // provide the price
        )));
      },
    );

    test(
        'emits [RideRequestWaitingState, RideRequestFailureState] when GetRideRequestUseCase returns Failure',
        () async {
      final expected = [
        RideRequestWaitingState(),
        RideRequestFailureState('Failed to get ride request'),
      ];
      expectLater(rideRequestBloc.stream, emitsInOrder(expected));
      rideRequestBloc.add(RideOfferEvent(RideOffer(
        user: User(
          fullname: 'John Doe', // provide the full name
          imageUrl: 'https://example.com/profile.jpg', // provide the image URL
          phoneNumber: '+1234567890', // provide the phone number
          age: 25, // provide the age
        ),
        currentLocation: Location(
          latitude: 37.7749, // provide the latitude
          longitude: -122.4194, // provide the longitude
        ),
        destination: Location(
          latitude: 34.0522, // provide the latitude
          longitude: -118.2437, // provide the longitude
        ),
        seatsAllocated: 2, // provide the number of seats allocated
        price: 10.0, // provide the price
      )));
    });
  });
}
