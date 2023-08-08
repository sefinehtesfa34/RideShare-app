import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:rideshare/features/pick_location/data/datasources/ride_remote_data_source.dart';
import 'package:rideshare/features/pick_location/data/repositories/ride_repository.dart';
import 'package:rideshare/features/pick_location/domain/entities/location.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_offer.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_request.dart';
import 'package:rideshare/features/pick_location/domain/entities/user.dart';

import 'destination_repository_test.mocks.dart';
import 'ride_repository_test.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([RideRemoteDataSource])
void main() {
  late RideRepositoryImpl repository;
  late MockRideRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRideRemoteDataSource();
    repository = RideRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: MockNetworkInfo(),
    );
  });

  final tRideOffer = RideOffer(
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
  );
  final tRideRequest = Stream<RideRequest>.value(
    RideRequest(
      driverName: 'John Doe', // provide the driver's name
      driverImageURL:
          'https://example.com/driver.jpg', // provide the driver's image URL
      driverRatingAverageOutOf5:
          4.5, // provide the driver's rating average out of 5
      driverReviews: 10, // provide the number of driver reviews
      carModel: 'Toyota Camry', // provide the car model
      availableSeats: 3, // provide the number of available seats in the car
      carImageURL: 'https://example.com/car.jpg', // provide the car image URL
      carPlateNumber: 'ABC123', // provide the car plate number
      driverPhoneNumber: '+1234567890', // provide the driver's phone number
      carLocation: Location(
        latitude: 37.7749, // provide the car's latitude
        longitude: -122.4194, // provide the car's longitude
      ),
      passengersList: [], // provide the list of passengers (if any)
      destination: Location(
        latitude: 34.0522, // provide the destination's latitude
        longitude: -118.2437, // provide the destination's longitude
      ),
    ),
  );

  test('should get ride request from the remote data source', () async {
    // arrange
    when(mockRemoteDataSource.getRideRequest(any))
        .thenAnswer((_) async => tRideRequest);
    // act
    final result = await repository.getRideRequest(tRideOffer);
    // assert
    verify(mockRemoteDataSource.getRideRequest(tRideOffer));
    expect(result, equals(Right(tRideRequest)));
  });
}
