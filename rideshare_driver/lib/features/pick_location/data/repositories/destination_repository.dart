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

/// `DestinationRepositoryImpl` is an implementation of the `DestinationRepository` interface.
/// It is responsible for fetching passenger history from a data source and handling potential errors.
///
/// It uses a `DestinationDataSource` to fetch the data and `NetworkInfo` to check the network status.
///
/// The `fetchPassengerHistory` method checks if the device is connected to the internet.
/// If it is, it tries to fetch the passenger history from the data source.
/// If the fetch is successful, it returns the data wrapped in a `Right` object.
/// If a `ServerException` is thrown, it returns a `ServerFailure` wrapped in a `Left` object.
///
/// If the device is not connected to the internet, it returns a `NetworkFailure` wrapped in a `Left` object.
///
/// Example:
/// ```dart
/// final repository = DestinationRepositoryImpl(
///   destinationDataSource: DestinationDataSourceImpl(),
///   networkInfo: NetworkInfoImpl(),
/// );
///
/// final result = await repository.fetchPassengerHistory();
/// result.fold(
///   (failure) => print('Error: $failure'),
///   (passengerHistory) => print('Passenger History: $passengerHistory'),
/// );
/// ```