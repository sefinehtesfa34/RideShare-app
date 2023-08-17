import 'package:dartz/dartz.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/destination.dart';
import '../datasources/destination_datasource.dart';

/// Destination Repository Implementation
///
/// This class implements the [DestinationRepository] interface and is responsible for
/// fetching passenger history destinations. It communicates with the data source and
/// handles network connectivity and exceptions.
class DestinationRepositoryImpl implements DestinationRepository {
  /// The data source for destination information.
  final DestinationDataSource destinationDataSource;

  /// Network connectivity information.
  final NetworkInfo networkInfo;

  /// Constructor for [DestinationRepositoryImpl].
  ///
  /// Requires instances of [DestinationDataSource] and [NetworkInfo].
  DestinationRepositoryImpl({
    required this.destinationDataSource,
    required this.networkInfo,
  });

  /// Fetches the history of destinations for a passenger.
  ///
  /// Returns an [Either] where the left side represents a [Failure] if the fetch operation
  /// encounters an error, and the right side contains a [List] of [Destination] if successful.
  ///
  /// Throws [ServerException] if the data source encounters a server-related error.
  /// Throws [NetworkException] if the device is not connected to the network.
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