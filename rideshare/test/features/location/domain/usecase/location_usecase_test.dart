import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/feeds/domain/usecase/location_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/feeds/domain/entity/location.dart';
import 'package:rideshare/features/feeds/data/model/location_model.dart';

import 'location_usecase_test.mocks.dart';

void main() {
  late GetLocationUsecase usecase;
  late MockLocationRepository mockRepository;

  setUp(() {
    mockRepository = MockLocationRepository();
    usecase = GetLocationUsecase(locationRepository: mockRepository);
  });

  group('GetLocationUsecase', () {
    const String cityName = 'example_city';
    Location location = LocationModel.fromJson(
        // ignore: always_specify_types
        const {'cityName': cityName, 'latitude': 12.345, 'longitude': 67.890});

    const Failure failure = ServerFailure('Location not found');

    test('should return location when getLocation is successful', () async {
      // Arrange
      when(mockRepository.getLocation(cityName))
          .thenAnswer((_) async => Right<Failure, Location>(location));

      // Act
      final Either<Failure, Location> result = await usecase(cityName);

      // Assert
      expect(result, Right<Failure, Location>(location));
      verify(mockRepository.getLocation(cityName)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when getLocation is unsuccessful', () async {
      // Arrange
      when(mockRepository.getLocation(cityName))
          .thenAnswer((_) async => const Left<Failure, Location>(failure));

      // Act
      final Either<Failure, Location> result = await usecase(cityName);

      // Assert
      expect(result, const Left<Failure, Location>(failure));
      verify(mockRepository.getLocation(cityName)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
