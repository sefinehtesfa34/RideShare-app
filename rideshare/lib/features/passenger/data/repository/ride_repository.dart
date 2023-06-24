import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure_messages.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../../domain/repository/ride_repository.dart';
import '../datasource/ride_remote_data_source.dart';

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
