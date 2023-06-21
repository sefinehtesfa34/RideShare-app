import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure_messages.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/passenger.dart';
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
      Passenger passenger) async {
    final bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NetworkFailure(networkFailureMessage));
    }
    try {
      final Stream<RideRequest> rideRequest =
          await remoteDataSource.getRideRequest(passenger);
      return Right(rideRequest);
    } catch (_) {
      return Left(ServerFailure(serverFailureMessage));
    }
  }
}
