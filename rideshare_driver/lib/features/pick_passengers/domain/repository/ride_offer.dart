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

  Future<Either<Failure, bool>> addPassenger(String rideOfferId);

  Future<Either<Failure, bool>> dropPassenger(String rideOfferId);
}
/// `RideOfferRepository` is an abstract class that defines the contract for the ride offer repository.
/// It provides methods to get ride offers, stop sending location, update driver location, add and drop passengers.
/// 
/// Methods:
/// 
/// - `getRideOffers(RideRequest request)`: This method returns a `Future` of `Either` `Failure` or a `Stream` of `List<RideOffer>`.
///   It takes a `RideRequest` object as an argument and fetches the ride offers based on the request.
/// 
/// - `stopSendingLocation(StreamController carLocationStreamController)`: This method returns an `Either` `Failure` or `bool`.
///   It takes a `StreamController` object as an argument and stops sending the car location.
/// 
/// - `updateDriverLocation(StreamController carLocationController)`: This method returns an `Either` `Failure` or `bool`.
///   It takes a `StreamController` object as an argument and updates the driver's location.
/// 
/// - `addPassenger(String rideOfferId)`: This method returns a `Future` of `Either` `Failure` or `bool`.
///   It takes a `rideOfferId` as an argument and adds a passenger to the ride offer with the given id.
/// 
/// - `dropPassenger(String rideOfferId)`: This method returns a `Future` of `Either` `Failure` or `bool`.
///   It takes a `rideOfferId` as an argument and drops a passenger from the ride offer with the given id.