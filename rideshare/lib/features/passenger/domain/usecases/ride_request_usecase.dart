import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ride_offer.dart';
import '../entities/ride_request.dart';
import '../repository/ride_repository.dart';

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
