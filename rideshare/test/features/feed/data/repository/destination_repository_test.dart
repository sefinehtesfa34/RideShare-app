// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:rideshare/core/errors/exception.dart';
// import 'package:rideshare/core/errors/failures.dart';
// import 'package:rideshare/core/network/network_info.dart';
// import 'package:rideshare/features/feed/data/datasources/destination_datasource.dart';
// import 'package:rideshare/features/feed/data/models/destination_model.dart';
// import 'package:rideshare/features/feed/data/repositories/destination_repository.dart';
// import 'package:rideshare/features/feed/domain/entities/destination.dart';

// import 'destination_repository_test.mocks.dart';

// @GenerateMocks([NetworkInfo])
// @GenerateMocks([DestinationDataSource])

// void main() {
//   group('DestinationRepositoryImpl', () {
//     late DestinationRepositoryImpl repository;
//     late MockDestinationDataSource mockDataSource;
//     late MockNetworkInfo mockNetworkInfo;

//     setUp(() {
//       mockDataSource = MockDestinationDataSource();
//       mockNetworkInfo = MockNetworkInfo();
//       repository = DestinationRepositoryImpl(
//         destinationDataSource: mockDataSource,
//         networkInfo: mockNetworkInfo,
//       );
//     });

//     group('fetchPassengerHistory', () {
//       List<DestinationModel> testDestinationModels = [
//         DestinationModel(name: 'Destination 1'),
//         DestinationModel(name: 'Destination 2'),
//       ];

//        List<Destination> testDestinations = [
//         Destination(name: 'Destination 1'),
//         Destination(name: 'Destination 2'),
//       ];

//       test('should check if the device is online', () async {
//         // Arrange
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//         when(mockDataSource.fetchPassengerHistory())
//             .thenAnswer((_) async => testDestinationModels);

//         // Act
//         await repository.fetchPassengerHistory();

//         // Assert
//         verify(mockNetworkInfo.isConnected).called(1);
//       });

//       test('should return Right with a list of destinations on successful data fetch', () async {
//         // Arrange
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//         when(mockDataSource.fetchPassengerHistory())
//             .thenAnswer((_) async => testDestinationModels);

//         // Act
//         final result = await repository.fetchPassengerHistory();

//         // Assert
//         expect(result, equals(Right(testDestinations)));
//       });

//       test('should return Left(ServerFailure) when a server exception occurs', () async {
//         // Arrange
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//         when(mockDataSource.fetchPassengerHistory()).thenThrow(ServerException("Server exception error"));

//         // Act
//         final result = await repository.fetchPassengerHistory();

//         // Assert
//         expect(result, equals(Left(ServerFailure('server failure'))));
//       });

//       test('should return Left(NetworkFailure) when the device is offline', () async {
//         // Arrange
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

//         // Act
//         final result = await repository.fetchPassengerHistory();

//         // Assert
//         expect(result, equals(Left(NetworkFailure('network failure'))));
//       });
//     });
//   });
// }