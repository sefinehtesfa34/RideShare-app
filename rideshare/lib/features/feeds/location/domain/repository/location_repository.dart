import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/feeds/location/domain/entity/location.dart';

abstract class LocationRepository extends Equatable {
  Future<Either<Failure, Location>> getLocation(String cityName);
}
