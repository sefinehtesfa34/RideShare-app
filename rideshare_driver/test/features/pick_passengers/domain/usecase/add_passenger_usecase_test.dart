import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';

import 'package:rideshare/features/pick_passengers/domain/usecase/add_passenger_usecase.dart';
import 'package:rideshare/features/pick_passengers/domain/repository/ride_offer.dart';

import 'add_passenger_usecase_test.mocks.dart';

@GenerateMocks([RideOfferRepository])
void main() {
  late AddPassengerUseCase usecase;
  late MockRideOfferRepository mockRideOfferRepository;

  setUp(() {
    mockRideOfferRepository = MockRideOfferRepository();
    usecase = AddPassengerUseCase(mockRideOfferRepository);
  });

  final tRideOfferId = '123';

  test('should add passenger to ride offer from the repository', () async {
    // arrange
    when(mockRideOfferRepository.addPassenger(tRideOfferId))
        .thenAnswer((_) async => Right<Failure, bool>(true));
    // act
    final result = await usecase(tRideOfferId);
    // assert
    expect(result, Right(true));
    verify(mockRideOfferRepository.addPassenger(tRideOfferId));
    verifyNoMoreInteractions(mockRideOfferRepository);
  });
}
