// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:rideshare/core/errors/failures.dart';
// import 'package:rideshare/features/feed/domain/entities/destination.dart';
// import 'package:rideshare/features/feed/domain/repositories/destination_repository.dart';
// import 'package:rideshare/features/feed/domain/usecases/destination_usecase.dart';

// import 'destination_usecase_test.mocks.dart';

// @GenerateMocks([DestinationRepository])
// void main() {
//   group('FetchPassengerHistoryUseCase', () {
//     late FetchPassengerHistoryUseCase useCase;
//     late MockDestinationRepository mockRepository;

//     setUp(() {
//       mockRepository = MockDestinationRepository();
//       useCase = FetchPassengerHistoryUseCase(mockRepository);
//     });

//     test('should return a list of destinations from the repository', () async {
//       // Arrange
//       List<Destination> testDestinations = [
//         Destination(name: 'Destination 1'),
//         Destination(name: 'Destination 2'),
//       ];
//       when(mockRepository.fetchPassengerHistory())
//           .thenAnswer((_) async => Right(testDestinations));

//       // Act
//       final result = await useCase.call();

//       // Assert
//       expect(result, equals(Right(testDestinations)));
//     });

//     test('should return a failure from the repository', () async {
//       // Arrange
//       const Failure testFailure = ServerFailure('server failure');
//       when(mockRepository.fetchPassengerHistory())
//           .thenAnswer((_) async => Left(testFailure));

//       // Act
//       final result = await useCase.call();

//       // Assert
//       expect(result, equals(Left(testFailure)));
//     });
//   });
// }
