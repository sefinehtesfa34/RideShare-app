import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/pick_passengers/data/datasource/ride_offer_datasource.dart';
import 'package:rideshare/features/pick_passengers/data/repositories/ride_offer_repository.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/location.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/ride_offer.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/ride_request.dart';

import 'ride_offer_repository_test.mocks.dart';

@GenerateMocks([RideOfferApi])

void main() {

  late RideOfferRepositoryImpl repository;
  late MockRideOfferApi mockRideOfferApi;

  setUp(() {
    mockRideOfferApi = MockRideOfferApi();
    repository = RideOfferRepositoryImpl(mockRideOfferApi);
  });

  group('getRideOffers', () {
final tRideRequest = RideRequest(
  driverName: 'Test Driver',
  driverImageURL: 'http://example.com/image.jpg',
  driverRatingAverageOutOf5: 4.5,
  driverReviews: 100,
  carModel: 'Test Car',
  availableSeats: 4,
  carImageURL: 'http://example.com/car.jpg',
  carPlateNumber: 'TEST123',
  driverPhoneNumber: '1234567890',
  carLocation: Location(latitude: 0.0, longitude: 0.0),
  passengersList: [],
  destination: Location(latitude: 1.0, longitude: 1.0),
);    final tRideOffers = Stream<List<RideOffer>>.value([]);

    test('should return ride offers when the call to API is successful', () async {
      // arrange
      when(mockRideOfferApi.getRideOffers(any))
          .thenAnswer((_) async => tRideOffers);
      // act
      final result = await repository.getRideOffers(tRideRequest);
      // assert
      expect(result, Right(tRideOffers));
      verify(mockRideOfferApi.getRideOffers(tRideRequest));
      verifyNoMoreInteractions(mockRideOfferApi);
    });

    test('should return server failure when the call to API is unsuccessful', () async {
      // arrange
      when(mockRideOfferApi.getRideOffers(any))
          .thenThrow(ServerFailure());
      // act
      final result = await repository.getRideOffers(tRideRequest);
      // assert
      expect(result, Left(ServerFailure()));
      verify(mockRideOfferApi.getRideOffers(tRideRequest));
      verifyNoMoreInteractions(mockRideOfferApi);
    });
  });

  // Similar tests can be written for addPassenger, dropPassenger, updateDriverLocation, and stopSendingLocation methods.
}