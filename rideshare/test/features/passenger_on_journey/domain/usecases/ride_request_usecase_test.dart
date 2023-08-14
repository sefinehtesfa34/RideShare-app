import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/location.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_offer.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_request.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/user.dart';
import 'package:rideshare/features/passenger_on_journey/domain/repository/ride_repository.dart';
import 'package:rideshare/features/passenger_on_journey/domain/usecases/ride_request_usecase.dart';

import 'ride_request_usecase_test.mocks.dart';

@GenerateMocks([RideRepository])
void main() {
  late GetRideRequestUseCase useCase;
  late MockRideRepository mockRepository;

  setUp(() {
    mockRepository = MockRideRepository();
    useCase = GetRideRequestUseCase(repository: mockRepository);
  });

  group('GetRideRequestUseCase', () {
    final tUser = User(
      fullname: 'John Doe',
      phoneNumber: '+1234567890',
      age: 30,
    );
    final tPassenger = RideOffer(
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

    final tRideRequest = Stream<RideRequest>.empty();

    test('should get ride request from the repository', () async {
      // arrange
      when(mockRepository.getRideRequest(tPassenger))
          .thenAnswer((_) async => Right(tRideRequest));
      // act
      final result = await useCase.call(tPassenger);
      // assert
      expect(result, equals(Right(tRideRequest)));
    });

    test('should return a failure from the repository', () async {
      // arrange
      final failure = ServerFailure("Server error");
      when(mockRepository.getRideRequest(tPassenger))
          .thenAnswer((_) async => Left(failure));
      // act
      final result = await useCase.call(tPassenger);
      // assert
      expect(result, equals(Left(failure)));
    });

    final tStream = Stream<RideRequest>.empty();

    test(
      'should return a stream of ride requests from the repository',
      () async {
        // arrange
        when(mockRepository.getRideRequest(tPassenger))
            .thenAnswer((_) async => Right(tStream));
        // act
        final result = await useCase.call(tPassenger);
        // assert
        expect(result, equals(Right(tStream)));
      },
    );

  });
}
