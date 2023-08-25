import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/ride_repository.dart';

class CancelRideRequest extends UseCase<bool, CancelRideParams> {
  final RideRepository repository;

  CancelRideRequest(this.repository);

  @override
  Future<Either<Failure, bool>> call(CancelRideParams params) async {
    return await repository.cancelRideRequest(
        params.rideRequestId, params.userPhone);
  }
}

class CancelRideParams extends Equatable {
  final String rideRequestId;
  final String userPhone;

  const CancelRideParams({
    required this.rideRequestId,
    required this.userPhone,
  });

  @override
  List<Object> get props => [rideRequestId, userPhone];
}

/**
 * This file contains the use case for cancelling a ride request.
 * 
 * Classes:
 * - `CancelRideRequest`: This class extends `UseCase` and overrides the `call` method to cancel a ride request.
 * - `CancelRideParams`: This class extends `Equatable` and holds the parameters required to cancel a ride request.
 * 
 * `CancelRideRequest` class:
 * - `repository`: An instance of `RideRepository` which is used to call the `cancelRideRequest` method.
 * - `call`: This method takes an instance of `CancelRideParams` as a parameter and calls the `cancelRideRequest` method from `RideRepository`.
 * 
 * `CancelRideParams` class:
 * - `rideRequestId`: The ID of the ride request to be cancelled.
 * - `userPhone`: The phone number of the user who is cancelling the ride request.
 * - `props`: A list of properties used by `Equatable` to determine if two instances are equal.
 */