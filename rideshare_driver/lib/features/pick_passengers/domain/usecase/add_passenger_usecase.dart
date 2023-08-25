import 'package:dartz/dartz.dart';

import 'package:rideshare/core/errors/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/ride_offer.dart';

class AddPassengerUseCase extends UseCase<bool, String> {
  final RideOfferRepository _rideOfferRepository;

  AddPassengerUseCase(this._rideOfferRepository);

  @override
  Future<Either<Failure, bool>> call(String rideOfferId) async {
    return await _rideOfferRepository.addPassenger(rideOfferId);
  }
}
/**
 * `add_passenger_usecase.dart`
 * 
 * This file contains the `AddPassengerUseCase` class which extends the `UseCase` class.
 * 
 * The `AddPassengerUseCase` class is responsible for adding a passenger to a ride offer.
 * It uses the `RideOfferRepository` to perform this operation.
 * 
 * The `call` method is overridden from the `UseCase` class and it takes a `rideOfferId` as a parameter.
 * This method returns a `Future` that resolves to an `Either` type. The `Either` type can be a `Failure` or a `bool`.
 * If the operation is successful, it returns `true`. If it fails, it returns a `Failure` object.
 * 
 * Usage:
 * 
 * ```dart
 * final addPassengerUseCase = AddPassengerUseCase(rideOfferRepository);
 * final result = await addPassengerUseCase.call(rideOfferId);
 * ```
 * 
 * Where `rideOfferRepository` is an instance of `RideOfferRepository` and `rideOfferId` is the ID of the ride offer.
 */