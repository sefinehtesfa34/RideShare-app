import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/entity/location.dart';
import '../../domain/repository/location_repository.dart';
import '../datasource/remote_location_data.dart';

class LocationRepositoryImpl extends LocationRepository {
  final RemoteLocationDataSource remoteLocationDataSource;
  LocationRepositoryImpl({required this.remoteLocationDataSource});
  @override
  Future<Either<Failure, Location>> getLocation(String cityName) async {
    try {
      final Location response =
          await remoteLocationDataSource.getLocation(cityName);
      return Right<Failure, Location>(response);
    } on ServerException {
      return const Left<Failure, Location>(ServerFailure('Server Failure'));
    }
  }

  @override
  List<Object?> get props => [];

  @override
  Future<Either<Failure, void>> postLocation(
    double sourceLatitude,
    double sourceLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    try {
      await remoteLocationDataSource.postLocation(
        sourceLatitude,
        sourceLongitude,
        destinationLatitude,
        destinationLongitude,
      );
      return const Right<Failure, void>(null);
    } on ServerException {
      return const Left<Failure, void>(ServerFailure('Server Failure'));
    }
  }
}
