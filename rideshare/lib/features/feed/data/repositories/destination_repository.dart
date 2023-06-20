import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/destination.dart';
import '../../domain/repositories/destination_repository.dart';
import '../datasources/destination_datasource.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationDataSource destinationDataSource;
  final NetworkInfo networkInfo;

  DestinationRepositoryImpl({
    required this.destinationDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Destination>>> fetchPassengerHistory() async {
    if (await networkInfo.isConnected) {
      try {
        final destination = await destinationDataSource.fetchPassengerHistory();

        return Right(destination);

      } on ServerException {

        return Left(ServerFailure("server failure"));
      }
    } else {

      return Left(NetworkFailure("network failure"));
    }
  }

  @override
  Future<Either<Failure, List<Destination>>> fetchPopularDestinations() async {
    if (await networkInfo.isConnected) {
      try {
        final destination = await destinationDataSource.fetchPopularDestinations();

        return Right(destination);

      } on ServerException {

        return Left(ServerFailure("server failure"));
      }
    } else {

      return Left(NetworkFailure("network failure"));
    }
  }
}


