import 'package:dartz/dartz.dart';

import 'package:rideshare/core/errors/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entity/ride_offer.dart';
import '../repository/ride_offer.dart';

class AddPassengerUseCase extends UseCase<bool, String> {
  final RideOfferRepository _rideOfferRepository;

  AddPassengerUseCase(this._rideOfferRepository);

  @override
  Future<Either<Failure, bool>> call(String rideOfferId) async {
        return await _rideOfferRepository.addPassegner(rideOfferId);
  }
}
