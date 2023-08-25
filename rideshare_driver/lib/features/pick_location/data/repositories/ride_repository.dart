import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure_messages.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../../domain/repositories/ride_repository.dart';
import '../datasources/ride_remote_data_source.dart';

class RideRepositoryImpl extends RideRepository {
  final RideRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RideRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Stream<RideRequest>>> getRideRequest(
      RideOffer passenger) async {
    try {
      final Stream<RideRequest> rideRequest =
          await remoteDataSource.getRideRequest(passenger);
      return Right(rideRequest);
    } catch (_) {
      return Left(ServerFailure(serverFailureMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelRideRequest(
      String rideRequestId, String userPhone) async {
    try {
      // Call the data source to cancel the ride request
      final bool canceled =
          await remoteDataSource.cancelRideRequest(rideRequestId, userPhone);
      return Right(canceled);
    } on ServerException {
      return Left(ServerFailure("Failed to cancel the ride request."));
    }
  }
}

/**
 * RideRepositoryImpl class.
 * 
 * This class extends the abstract class RideRepository and implements its methods.
 * It uses a remote data source and network information to perform its operations.
 * 
 * It has two main methods:
 * 
 * 1. getRideRequest(RideOffer passenger): This method takes a RideOffer object as input and returns a Future of Either Failure or a Stream of RideRequest.
 *    It tries to get the ride request from the remote data source and returns it. If it fails, it returns a ServerFailure.
 * 
 * 2. cancelRideRequest(String rideRequestId, String userPhone): This method takes a ride request ID and a user phone number as input and returns a Future of Either Failure or a boolean.
 *    It tries to cancel the ride request using the remote data source and returns the result. If it fails, it returns a ServerFailure.
 * 
 * The class constructor requires a remote data source and network information to be passed in.
 */