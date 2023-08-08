import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';
import 'package:rideshare/features/pick_location/domain/usecases/destination_usecase.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';

import 'destination_usecase_test.mocks.dart';

@GenerateMocks([DestinationRepository])
void main() {
  late FetchPassengerHistoryUseCase useCase;
  late MockDestinationRepository mockRepository;

  setUp(() {
    mockRepository = MockDestinationRepository();
    useCase = FetchPassengerHistoryUseCase(mockRepository);
  });

  test('should fetch passenger history from the repository', () async {
    // Arrange
    final expectedHistory = [
      Destination(name: 'Destination 1', latitude: 0.0, longitude: 0.0),
    ];
    when(mockRepository.fetchPassengerHistory())
        .thenAnswer((_) async => Right(expectedHistory));

    // Act
    final result = await useCase.call();

    // Assert
    expect(result, Right(expectedHistory));
    verify(mockRepository.fetchPassengerHistory());
    verifyNoMoreInteractions(mockRepository);
  });
}
