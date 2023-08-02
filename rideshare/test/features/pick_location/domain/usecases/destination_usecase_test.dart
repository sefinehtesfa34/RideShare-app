import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';
import 'package:rideshare/features/pick_location/domain/usecases/destination_usecase.dart';
import 'package:mockito/mockito.dart';

import 'destination_usecase_test.mocks.dart';

@GenerateMocks([DestinationRepository])

void main() {
  late FetchPassengerHistoryUseCase useCase;
  late MockDestinationRepository mockRepository;

  setUp(() {
    mockRepository = MockDestinationRepository();
    useCase = FetchPassengerHistoryUseCase(mockRepository);
  });

  group('FetchPassengerHistoryUseCase', () {
    final tDestination = Destination(
      name: 'Test',
      latitude: 1.0,
      longitude: 1.0,
    );
    final tDestinationList = [tDestination];

    test(
      'should return destination list from the repository',
      () async {
        // arrange
        when(mockRepository.fetchPassengerHistory())
            .thenAnswer((_) async => Right(tDestinationList));
        // act
        final result = await useCase.call();
        // assert
        expect(result, equals(Right(tDestinationList)));
      },
    );

    test(
      'should return a failure from the repository',
      () async {
        // arrange
        final failure = ServerFailure("Server error");
        when(mockRepository.fetchPassengerHistory())
            .thenAnswer((_) async => Left(failure));
        // act
        final result = await useCase.call();
        // assert
        expect(result, equals(Left(failure)));
      },
    );
  });
}
