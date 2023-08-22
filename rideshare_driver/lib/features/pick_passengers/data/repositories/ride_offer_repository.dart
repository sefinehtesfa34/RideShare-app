import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/repository/ride_offer.dart';
import '../../domain/entity/ride_request.dart';
import '../datasource/ride_offer_datasource.dart';

class RideOfferRepositoryImpl implements RideOfferRepository {
  final RideOfferApi _rideOfferApi;

  RideOfferRepositoryImpl(this._rideOfferApi);

  @override
  Future<Either<Failure, Stream<List<RideOffer>>>> getRideOffers(
      RideRequest request) async {
    try {
      Stream<List<RideOffer>> offerList =
          await _rideOfferApi.getRideOffers(request);
      return Right(offerList);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addPassenger(String rideOfferId) async {
    try {
      final result = await _rideOfferApi.addPassenger(rideOfferId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> dropPassenger(String rideOfferId) async {
    try {
      final result = await _rideOfferApi.dropPassegner(rideOfferId);
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

/// `RideOfferRepositoryImpl` is an implementation of the `RideOfferRepository` interface.
/// It uses the `RideOfferApi` to perform operations related to ride offers.
///
/// It has the following methods:
/// - `getRideOffers(RideRequest request)`: Fetches a stream of ride offers based on the given ride request.
/// - `addPassenger(String rideOfferId)`: Adds a passenger to a ride offer with the given ID.
/// - `dropPassenger(String rideOfferId)`: Drops a passenger from a ride offer with the given ID.
/// - `updateDriverLocation(StreamController carLocationController)`: Updates the driver's location.
/// - `stopSendingLocation(StreamController carLocationStreamController)`: Stops sending the driver's location.
///
/// Each method returns an `Either` type, which can be a `Failure` or the expected result.
/// If an error occurs during the operation, a `ServerFailure` is returned.