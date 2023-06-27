import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/ride_offer.dart';
import '../repository/ride_offer.dart';


class GetRideOffersUseCase extends UseCase<Stream<List<RideOffer>>, NoParams > {
  final RideOfferRepository _rideOfferRepository;

  GetRideOffersUseCase(this._rideOfferRepository);
  
  @override
  Future<Either<Failure, Stream<List<RideOffer>>>> call(NoParams params) async {
    return await _rideOfferRepository.getRideOffers();
  }
}
