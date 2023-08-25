import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ride_offer.dart';
import '../entities/ride_request.dart';
import '../repositories/ride_repository.dart';

class GetRideRequestUseCase implements UseCase<Stream<RideRequest>, RideOffer> {
  final RideRepository _repository;

  GetRideRequestUseCase({required RideRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, Stream<RideRequest>>> call(RideOffer passenger) async {
    final rideRequestEither = await _repository.getRideRequest(passenger);
    return rideRequestEither;
  }
}
/**
 * `ride_request_usecase.dart`
 * 
 * This file contains the `GetRideRequestUseCase` class which implements `UseCase`.
 * 
 * Classes:
 * `GetRideRequestUseCase`: A use case class for getting ride requests.
 * 
 * The `GetRideRequestUseCase` class has the following properties:
 * `_repository`: An instance of `RideRepository` which is used to interact with the ride data.
 * 
 * The `GetRideRequestUseCase` class has the following methods:
 * `call`: This method takes a `RideOffer` object as a parameter and returns a `Future` object 
 * that will be either a `Failure` or a `Stream` of `RideRequest` objects. It fetches the ride 
 * request from the repository using the provided ride offer.
 * 
 * Usage:
 * 
 * ```dart
 * final rideRepository = RideRepository();
 * final getRideRequestUseCase = GetRideRequestUseCase(repository: rideRepository);
 * final rideOffer = RideOffer();
 * final rideRequestEither = await getRideRequestUseCase.call(rideOffer);
 * ```
 */