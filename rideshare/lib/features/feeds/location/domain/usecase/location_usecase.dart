import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';
import 'package:rideshare/features/feeds/location/domain/entity/location.dart';
import 'package:rideshare/features/feeds/location/domain/repository/location_repository.dart';

class GetLocationUsecase extends UseCase<Location, String> {
  final LocationRepository locationRepository;
  GetLocationUsecase({required this.locationRepository});
  @override
  Future<Either<Failure, Location>> call(String params) async {
    return await locationRepository.getLocation(params);
  }
}

class PostLocationUsecase extends UseCase<void, Params> {
  final LocationRepository locationRepository;
  PostLocationUsecase({required this.locationRepository});
  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await locationRepository.postLocation(
      params.sourceLatitude,
      params.sourceLongitude,
      params.destinationLatitude,
      params.destinationLongitude,
    );
  }
}

class Params {
  double sourceLatitude;
  double sourceLongitude;
  double destinationLatitude;
  double destinationLongitude;

  Params({
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.sourceLatitude,
    required this.sourceLongitude,
  });
}
