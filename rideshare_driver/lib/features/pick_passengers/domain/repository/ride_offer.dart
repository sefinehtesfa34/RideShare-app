import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/ride_offer.dart';
import '../entity/ride_request.dart';

abstract class RideOfferRepository {
  Future<Either<Failure, Stream<List<RideOffer>>>> getRideOffers(
      RideRequest request);

  Either<Failure, bool> stopSendingLocation(
      StreamController carLocationStreamController);

  Either<Failure, bool> updateDriverLocation(
      StreamController carLocationController);

  Future<Either<Failure, bool>> addPassegner(String rideOfferId);
}
