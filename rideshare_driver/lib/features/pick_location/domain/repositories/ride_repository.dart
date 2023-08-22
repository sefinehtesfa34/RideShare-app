import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/ride_offer.dart';
import '../entities/ride_request.dart';

abstract class RideRepository {
  Future<Either<Failure, Stream<RideRequest>>> getRideRequest(
      RideOffer rideRequestStream);
  Future<Either<Failure, bool>> cancelRideRequest(
      String rideRequestId, String userPhone);
}


/// This file defines the abstract class RideRepository which outlines the
/// necessary methods for handling ride requests and cancellations.
///
/// The RideRepository class has two methods:
///
/// 1. getRideRequest: This method takes a RideOffer object as an argument
/// and returns a Future that will complete with either a Failure or a
/// Stream of RideRequest objects. This method is used to fetch ride
/// requests associated with a particular ride offer.
///
/// 2. cancelRideRequest: This method takes a ride request ID and a user phone
/// number as arguments and returns a Future that will complete with either
/// a Failure or a bool indicating whether the ride request was
/// successfully cancelled. This method is used to cancel a ride request.
///
/// Both methods return a Future of an Either type. The Either type is a
/// way to handle errors in Dart. It can hold either a Failure object, which
/// represents an error, or a value representing a successful operation.
///
/// The RideRepository class is part of the domain layer of the application,
/// which means it contains business logic but doesn't interact with the
/// infrastructure layer directly. Instead, it defines the interface that the
/// infrastructure layer must implement.

 