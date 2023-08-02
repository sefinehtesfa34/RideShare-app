import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/core/network/network_info.dart';
import 'package:rideshare/features/pick_location/data/datasources/destination_datasource.dart';
import 'package:rideshare/features/pick_location/data/repositories/destination_repository.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';
import 'destination_repository_test.mocks.dart';


@GenerateMocks([DestinationDataSource, NetworkInfo])

void main() {
  late DestinationRepositoryImpl repository;
  late MockDestinationDataSource mockDestinationDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockDestinationDataSource = MockDestinationDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = DestinationRepositoryImpl(
      destinationDataSource: mockDestinationDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('fetchPassengerHistory', () {
    final tDestination = Destination(
      name: 'Test',
      latitude: 1.0,
      longitude: 1.0,
    );
    final tDestinationList = [tDestination];

    test('should return destination list when the call to data source is successful', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
      when(mockDestinationDataSource.fetchPassengerHistory()).thenAnswer((_) => Future.value(tDestinationList));
      
      // act
      final result = await repository.fetchPassengerHistory();
      
      // assert
      verify(mockDestinationDataSource.fetchPassengerHistory());
      expect(result, equals(Right(tDestinationList)));
    });

    test('should return server failure when the call to data source is unsuccessful', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
      when(mockDestinationDataSource.fetchPassengerHistory()).thenThrow(ServerException("server failure"));

      // act
      final result = await repository.fetchPassengerHistory();

      // assert
      verify(mockDestinationDataSource.fetchPassengerHistory());
      expect(result, equals(Left(ServerFailure("server failure"))));
    });

    test('should return network failure when the device is offline', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(false));

      // act
      final result = await repository.fetchPassengerHistory();

      // assert
      verifyZeroInteractions(mockDestinationDataSource);
      expect(result, equals(Left(NetworkFailure("network failure"))));
    });
  });
}
