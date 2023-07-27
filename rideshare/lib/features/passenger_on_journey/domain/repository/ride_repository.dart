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
