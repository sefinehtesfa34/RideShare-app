import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:rideshare/core/errors/failures.dart';

import 'package:mockito/mockito.dart';
import 'package:rideshare/features/passenger_on_journey/domain/repository/ride_repository.dart';
import 'package:rideshare/features/passenger_on_journey/domain/usecases/cancel_ride_usecase.dart';

import 'cancel_ride_usecase_test.mocks.dart';

@GenerateMocks([RideRepository])

void main() {
  late CancelRideRequest useCase;
  late MockRideRepository mockRepository;

  setUp(() {
    mockRepository = MockRideRepository();
    useCase = CancelRideRequest(mockRepository);
  });

  group('CancelRideRequest', () {
    final tParams = CancelRideParams(
      rideRequestId: 'Test Ride Request Id',
      userPhone: 'Test User Phone',
    );
    final tResult = true;

    test(
      'should return true after cancelling the ride request from the repository',
      () async {
        // arrange
        when(mockRepository.cancelRideRequest(tParams.rideRequestId, tParams.userPhone))
            .thenAnswer((_) async => Right(tResult));
        // act
        final result = await useCase(tParams);
        // assert
        expect(result, equals(Right(tResult)));
      },
    );

    test(
      'should return a failure from the repository',
      () async {
        // arrange
        final failure = ServerFailure("Server error");
        when(mockRepository.cancelRideRequest(tParams.rideRequestId, tParams.userPhone))
            .thenAnswer((_) async => Left(failure));
        // act
        final result = await useCase(tParams);
        // assert
        expect(result, equals(Left(failure)));
      },
    );
  });
}
