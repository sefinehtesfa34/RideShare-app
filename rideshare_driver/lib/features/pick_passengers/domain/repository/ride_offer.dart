import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/ride_offer.dart';

abstract class RideOfferRepository {
  Future<Either<Failure, Stream<List<RideOffer>>>> getRideOffers();

  Either<Failure, bool> stopSendingLocation(
      StreamController carLocationStreamController);

  Either<Failure, bool> updateDriverLocation(
      StreamController carLocationController);

  Future<Either<Failure, bool>> addPassegner(String rideOfferId);
}
