import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/features/passenger_on_journey/data/datasource/ride_remote_data_source.dart';
import 'package:rideshare/features/passenger_on_journey/data/datasource/ride_request_api_provider.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/location.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_offer.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_request.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/user.dart';

import 'ride_remote_data_source_test.mocks.dart';

@GenerateMocks([RideRequestApiProvider])
void main() {
  late RideRemoteDataSourceImpl dataSource;
  late MockRideRequestApiProvider mockRideRequestApiProvider;

  setUp(() {
    mockRideRequestApiProvider = MockRideRequestApiProvider();
    dataSource = RideRemoteDataSourceImpl(mockRideRequestApiProvider);
  });

  group('getRideRequest', () {
    final tUser = User(
      fullname: 'John Doe',
      phoneNumber: '+1234567890',
      age: 30,
    );

    final tRideOffer = RideOffer(
      accepted: true,
      originAddress: 'Origin Address',
      destinationAddress: 'Destination Address',
      user: tUser,
      status: 'Active',
      rideOfferId: '123456',
      currentLocation: Location(
        latitude: 37.7749,
        longitude: -122.4194,
      ),
      destination: Location(
        latitude: 37.3382,
        longitude: -121.8863,
      ),
      seatsAllocated: 3,
      price: 25.0,
    );

    final tRideRequestStream = Stream.value(RideRequest(
      driverName: 'John',
      driverImageURL: 'https://example.com/driver.jpg',
      driverRatingAverageOutOf5: 4.5,
      carModel: 'Toyota Camry',
      availableSeats: 3,
      carImageURL: 'https://example.com/car.jpg',
      carPlateNumber: 'ABC123',
      driverPhoneNumber: '555-555-5555',
      carLocation: Location(latitude: 37.7749, longitude: -122.4194),
      passengersList: [],
    ));

    test(
      'should return a Stream<RideRequest> when the call to the API is successful',
      () async {
        // arrange
        when(mockRideRequestApiProvider.getRideRequestsForPassenger(any))
            .thenAnswer((_) async => tRideRequestStream);
        // act
        final result = await dataSource.getRideRequest(tRideOffer);
        // assert
        expect(result, tRideRequestStream);
      },
    );

    test(
      'should throw a ServerException when the call to the API is unsuccessful',
      () async {
        // arrange
        when(mockRideRequestApiProvider.getRideRequestsForPassenger(any))
            .thenThrow(ServerException("Server exception"));
        // act
        final call = dataSource.getRideRequest;
        // assert
        expect(
            () => call(tRideOffer), throwsA(isInstanceOf<ServerException>()));
      },
    );
  });

  // group('cancelRideRequest', () {
  //   final tRideRequestId = '123';
  //   final tUserPhone = '456';

  //   test(
  //     'should return false when the call to the API is successful',
  //     () async {
  //       // arrange
  //       when(mockRideRequestApiProvider.cancelRideRequest(any, any))
  //           .thenAnswer((_) async => http.Response('false', 200));
  //       // act
  //       final result =
  //           await dataSource.cancelRideRequest(tRideRequestId, tUserPhone);
  //       // assert
  //       expect(result, false);
  //     },
  //   );

  //   test(
  //     'should throw a ServerException when the call to the API is unsuccessful',
  //     () async {
  //       // arrange
  //       when(mockRideRequestApiProvider.cancelRideRequest(any, any))
  //           .thenThrow(ServerException("Server Exception"));
  //       // act
  //       final call = dataSource.cancelRideRequest;
  //       // assert
  //       expect(() => call(tRideRequestId, tUserPhone),
  //           throwsA(isInstanceOf<ServerException>()));
  //     },
  //   );
  // });
}
