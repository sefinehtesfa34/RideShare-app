import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/ride_offer.dart';
import '../entity/ride_request.dart';
import '../repository/ride_offer.dart';

class GetRideOffersUseCase
    extends UseCase<Stream<List<RideOffer>>, RideRequest> {
  final RideOfferRepository _rideOfferRepository;

  GetRideOffersUseCase(this._rideOfferRepository);

  @override
  Future<Either<Failure, Stream<List<RideOffer>>>> call(
      RideRequest params) async {
    return await _rideOfferRepository.getRideOffers(params);
  }
}
