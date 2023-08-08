import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/pick_location/domain/repositories/ride_repository.dart';
import 'package:rideshare/features/pick_location/domain/usecases/cancel_ride_usecase.dart';

import 'cancel_ride_usecase_test.mocks.dart';

@GenerateMocks([RideRepository])
void main() {
  late CancelRideRequest cancelRideRequest;
  late MockRideRepository mockRideRepository;

  setUp(() {
    mockRideRepository = MockRideRepository();
    cancelRideRequest = CancelRideRequest(mockRideRepository);
  });

  test('should call cancelRideRequest method with correct parameters',
      () async {
    // Arrange
    final rideRequestId = 'rideRequestId';
    final userPhone = 'userPhone';
    final params =
        CancelRideParams(rideRequestId: rideRequestId, userPhone: userPhone);
    when(mockRideRepository.cancelRideRequest(rideRequestId, userPhone))
        .thenAnswer((_) async => Right(true));

    // Act
    await cancelRideRequest(params);

    // Assert
    verify(mockRideRepository.cancelRideRequest(rideRequestId, userPhone));
  });

  test('should return success when cancelRideRequest is called', () async {
    // Arrange
    final rideRequestId = 'rideRequestId';
    final userPhone = 'userPhone';
    final params =
        CancelRideParams(rideRequestId: rideRequestId, userPhone: userPhone);
    when(mockRideRepository.cancelRideRequest(rideRequestId, userPhone))
        .thenAnswer((_) async => Right(true));

    // Act
    final result = await cancelRideRequest(params);

    // Assert
    expect(result, Right(true));
  });

  // Add the stub for cancelRideRequest method
  test(
      'should return success when cancelRideRequest is called with specific arguments',
      () async {
    // Arrange
    final rideRequestId = 'rideRequestId';
    final userPhone = 'userPhone';
    when(mockRideRepository.cancelRideRequest(rideRequestId, userPhone))
        .thenAnswer((_) async => Right(true));

    // Act
    final result = await cancelRideRequest(
        CancelRideParams(rideRequestId: rideRequestId, userPhone: userPhone));

    // Assert
    expect(result, Right(true));
  });
}