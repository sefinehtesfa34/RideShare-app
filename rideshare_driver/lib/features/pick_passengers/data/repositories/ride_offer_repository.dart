import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/repository/ride_offer.dart';
import '../datasource/ride_offer_datasource.dart';

class RideOfferRepositoryImpl implements RideOfferRepository {
  final RideOfferApi _rideOfferApi;

  RideOfferRepositoryImpl(this._rideOfferApi);

  @override
  Future<Either<Failure, Stream<List<RideOffer>>>> getRideOffers() async {
    try {
      Stream<List<RideOffer>> offerList = await _rideOfferApi.getRideOffers();
      return Right(offerList);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addPassegner(String rideOfferId) async {
    try {
      final result = await _rideOfferApi.addPassenger(rideOfferId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> updateDriverLocation(
      StreamController carLocationController) {
    try {
      _rideOfferApi.updateDriverLocation(carLocationController);
      return Right(true);
    } catch (ex) {
      print("update driver location failed: $ex");
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> stopSendingLocation(
      StreamController carLocationStreamController) {
    try {
      _rideOfferApi.stopSendingLocation(carLocationStreamController);
      return Right(true);
    } catch (ex) {
      print("update driver location failed: $ex");
      return Left(ServerFailure());
    }
  }
}
