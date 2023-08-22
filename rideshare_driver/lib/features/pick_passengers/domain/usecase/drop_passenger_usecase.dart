import 'package:dartz/dartz.dart';

import 'package:rideshare/core/errors/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/ride_offer.dart';

class DropPassengerUseCase extends UseCase<bool, String> {
  final RideOfferRepository _rideOfferRepository;

  DropPassengerUseCase(this._rideOfferRepository);

  @override
  Future<Either<Failure, bool>> call(String rideOfferId) async {
    return await _rideOfferRepository.dropPassenger(rideOfferId);
  }
}

/**
 * `drop_passenger_usecase.dart`
 * 
 * This file contains the `DropPassengerUseCase` class which extends the `UseCase` class.
 * 
 * The `DropPassengerUseCase` class is responsible for handling the use case of dropping a passenger from a ride offer.
 * It takes a `RideOfferRepository` object as a dependency through its constructor.
 * 
 * The `call` method is overridden from the `UseCase` class. It takes a `rideOfferId` as a parameter,
 * and it calls the `dropPassenger` method of the `RideOfferRepository` object.
 * 
 * The `dropPassenger` method returns a `Future` that resolves to an `Either` object.
 * The `Either` object contains a `Failure` object if the operation fails, or a `bool` indicating the success of the operation.
 */