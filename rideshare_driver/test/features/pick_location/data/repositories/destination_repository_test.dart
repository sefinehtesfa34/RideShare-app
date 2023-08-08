import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/features/pick_location/data/datasources/destination_datasource.dart';
import 'package:rideshare/features/pick_location/data/repositories/destination_repository.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/network/network_info.dart';

import 'destination_repository_test.mocks.dart';

@GenerateMocks([DestinationDataSource, NetworkInfo])
void main() {
  late DestinationRepositoryImpl repository;
  late MockDestinationDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockDataSource = MockDestinationDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = DestinationRepositoryImpl(
      destinationDataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('fetchPassengerHistory', () {
    final testDestination =
        Destination(name: 'Destination 1', latitude: 0.0, longitude: 0.0);
    final testFailure = ServerFailure('server failure');
    test('should return a list of destinations when network is connected',
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockDataSource.fetchPassengerHistory())
          .thenAnswer((_) async => [testDestination]);

      // Act
      final result = await repository.fetchPassengerHistory();

      // Assert
      expect(
        result.fold((failure) => null, (destinations) => destinations),
        [testDestination],
      );
      verify(mockNetworkInfo.isConnected);
      verify(mockDataSource.fetchPassengerHistory());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a ServerFailure when an exception is thrown', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockDataSource.fetchPassengerHistory())
          .thenThrow(ServerException('Server Exception'));

      // Act
      final result = await repository.fetchPassengerHistory();

      // Assert
      expect(result, equals(Left(testFailure)));
      verify(mockNetworkInfo.isConnected);
      verify(mockDataSource.fetchPassengerHistory());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a NetworkFailure when network is not connected',
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // Act
      final result = await repository.fetchPassengerHistory();

      // Assert
      expect(result, equals(Left(NetworkFailure('network failure'))));
      verify(mockNetworkInfo.isConnected);
      verifyZeroInteractions(mockDataSource);
    });
  });
}
