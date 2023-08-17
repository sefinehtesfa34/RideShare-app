import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ride_offer.dart';
import '../entities/ride_request.dart';
import '../repository/ride_repository.dart';

/// Get Ride Request Use Case
///
/// This use case is responsible for retrieving a stream of ride requests for a given ride offer.
/// It communicates with the [RideRepository] to fetch the ride requests.
/// The result is returned as a [Stream] of [RideRequest] objects wrapped in an [Either] type,
/// representing either a [Failure] or a successful result.
class GetRideRequestUseCase
    implements UseCase<Stream<RideRequest>, RideOffer> {
  final RideRepository _repository;

  /// Creates a [GetRideRequestUseCase] with the provided [repository].
  GetRideRequestUseCase({required RideRepository repository})
      : _repository = repository;

  /// Retrieves a stream of ride requests for a given ride offer.
  ///
  /// Returns an [Either] where the left side represents a [Failure] if the retrieval operation
  /// encounters an error, and the right side contains a [Stream] of [RideRequest] if successful.
  ///
  /// Throws [Exception] if an unexpected error occurs during the retrieval operation.
  @override
  Future<Either<Failure, Stream<RideRequest>>> call(RideOffer passenger) async {
    final rideRequestEither = await _repository.getRideRequest(passenger);
    return rideRequestEither;
  }
}
