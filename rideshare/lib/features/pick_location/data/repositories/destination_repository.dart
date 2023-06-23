import 'package:dartz/dartz.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/destination.dart';
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
}
