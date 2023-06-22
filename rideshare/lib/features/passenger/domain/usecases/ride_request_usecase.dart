
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/passenger.dart';
import '../entities/ride_request.dart';
import '../repository/ride_repository.dart';

class GetRideRequestUseCase
    implements UseCase<Stream<RideRequest>, Passenger> {
  final RideRepository _repository;

  GetRideRequestUseCase({required RideRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, Stream<RideRequest>>> call(
      Passenger passenger) async {
    final rideRequestEither =
        await _repository.getRideRequest(passenger);
    return rideRequestEither;
  }
}
