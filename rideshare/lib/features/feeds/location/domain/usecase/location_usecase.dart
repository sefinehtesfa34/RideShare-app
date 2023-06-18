import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';
import 'package:rideshare/features/feeds/location/domain/entity/location.dart';
import 'package:rideshare/features/feeds/location/domain/repository/location_repository.dart';

class LocationUsecase extends UseCase<Location, String> {
  final LocationRepository locationRepository;
  LocationUsecase({required this.locationRepository});
  @override
  Future<Either<Failure, Location>> call(String params) async {
    return await locationRepository.getLocation(params);
  }
}
