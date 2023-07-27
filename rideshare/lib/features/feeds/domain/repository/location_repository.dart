import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/feeds/domain/entity/location.dart';

abstract class LocationRepository extends Equatable {
  Future<Either<Failure, Location>> getLocation(String cityName);
  Future<Either<Failure, void>> postLocation(
    double sourceLatitude,
    double sourceLongitude,
    double destinationLatitude,
    double destinationLongitude,
  );
}
