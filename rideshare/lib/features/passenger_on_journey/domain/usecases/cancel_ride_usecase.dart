import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/ride_repository.dart';

/// Cancel Ride Request Use Case
///
/// This use case is responsible for canceling a ride request made by a user.
/// It communicates with the [RideRepository] to perform the cancellation.
/// The result is returned as an [Either] type, representing either a [Failure] or a successful result.
class CancelRideRequest extends UseCase<bool, CancelRideParams> {
  final RideRepository repository;

  /// Creates a [CancelRideRequest] with the provided [repository].
  CancelRideRequest(this.repository);

  /// Cancels a ride request based on the provided parameters.
  ///
  /// Returns an [Either] where the left side represents a [Failure] if the cancellation operation
  /// encounters an error, and the right side contains a [bool] indicating the success of the cancellation.
  ///
  /// Throws [Exception] if an unexpected error occurs during the cancellation operation.
  @override
  Future<Either<Failure, bool>> call(CancelRideParams params) async {
    return await repository.cancelRideRequest(
        params.rideRequestId, params.userPhone);
  }
}

/// Parameters for Canceling a Ride Request
///
/// Holds the necessary information to cancel a ride request.
class CancelRideParams extends Equatable {
  final String rideRequestId;
  final String userPhone;

  /// Creates [CancelRideParams] with the required parameters.
  const CancelRideParams({
    required this.rideRequestId,
    required this.userPhone,
  });

  @override
  List<Object> get props => [rideRequestId, userPhone];
}
