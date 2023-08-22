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
/**
 * `get_ride_offers_usecase.dart`
 * 
 * This file contains the `GetRideOffersUseCase` class, which extends the `UseCase` class.
 * 
 * The `GetRideOffersUseCase` class is responsible for handling the use case of getting ride offers.
 * It takes a `RideRequest` as input and returns a `Stream` of a list of `RideOffer` objects.
 * 
 * The class has a single private member `_rideOfferRepository` of type `RideOfferRepository`.
 * This repository is used to fetch the ride offers.
 * 
 * The `call` method is overridden from the `UseCase` class. It takes a `RideRequest` object as input,
 * and returns a `Future` of `Either` `Failure` or a `Stream` of a list of `RideOffer` objects.
 * This method is responsible for calling the `getRideOffers` method of the `_rideOfferRepository` object.
 * 
 * Usage:
 * 
 * ```dart
 * final rideOfferRepository = RideOfferRepository();
 * final getRideOffersUseCase = GetRideOffersUseCase(rideOfferRepository);
 * final rideRequest = RideRequest();
 * final rideOffers = await getRideOffersUseCase.call(rideRequest);
 * ```
 */