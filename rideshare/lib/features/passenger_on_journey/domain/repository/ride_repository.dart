import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/ride_offer.dart';
import '../entities/ride_request.dart';

/// Ride Repository Interface
///
/// This interface defines the contract for managing ride requests and offers.
/// Implementations of this interface are responsible for communicating with data sources,

abstract class RideRepository {
  /// Retrieves a stream of ride requests for a given ride offer.
  ///
  /// Returns an [Either] where the left side represents a [Failure] if the retrieval operation
  /// encounters an error, and the right side contains a [Stream] of [RideRequest] if successful.
  ///
  /// Throws [Exception] if an unexpected error occurs during the retrieval operation.
  Future<Either<Failure, Stream<RideRequest>>> getRideRequest(
    RideOffer rideRequestStream,
  );

  /// Cancels a ride request.
  ///
  /// Returns an [Either] where the left side represents a [Failure] if the cancellation operation
  /// encounters an error, and the right side contains a [bool] indicating the success status.
  ///
  /// Throws [Exception] if an unexpected error occurs during the cancellation operation.
  Future<Either<Failure, bool>> cancelRideRequest(
    String rideRequestId,
    String userPhone,
  );
}
