import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';

import '../../../authentication/domain/usecases/signup_test.mocks.dart';
import '../usecases/destination_usecase_test.mocks.dart';

@GenerateMocks([DestinationRepository, Failure])
void main() {
  late MockDestinationRepository destinationRepository;
  late Failure myFailure;

  setUp(() {
    destinationRepository = MockDestinationRepository();
    myFailure = MockFailure();
  });

  group('fetchPassengerHistory', () {
    test('should return a list of destinations on success', () async {
      // Arrange
      final expectedDestinations = [
        Destination(name: 'Destination 1', latitude: 0.0, longitude: 0.0),
        Destination(name: 'Destination 2', latitude: 4.0, longitude: 0.5),
      ];
      when(destinationRepository.fetchPassengerHistory())
          .thenAnswer((_) async => Right(expectedDestinations));
      // Act
      final result = await destinationRepository.fetchPassengerHistory();

      // Assert
      expect(result, Right(expectedDestinations));
    });

    test('should return a failure on error', () async {
      // Arrange
      final expectedFailure = myFailure;
      when(destinationRepository.fetchPassengerHistory())
          .thenAnswer((_) async => Left(expectedFailure));

      // Act
      final result = await destinationRepository.fetchPassengerHistory();

      // Assert
      expect(result, Left(expectedFailure));
    });
  });
}
