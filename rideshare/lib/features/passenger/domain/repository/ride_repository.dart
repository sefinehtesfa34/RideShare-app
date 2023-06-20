
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/passenger.dart';
import '../entities/ride_request.dart';

abstract class RideRepository {
  Future<Either<Failure, Stream<RideRequest>>> getRideRequest(
      Passenger rideRequestStream);
}
