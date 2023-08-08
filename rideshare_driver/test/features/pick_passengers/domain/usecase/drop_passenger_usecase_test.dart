import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:rideshare/features/pick_passengers/domain/usecase/drop_passenger_usecase.dart';
import 'package:rideshare/features/pick_passengers/domain/repository/ride_offer.dart';

import 'add_passenger_usecase_test.mocks.dart';

@GenerateMocks([RideOfferRepository])
void main() {
  late DropPassengerUseCase usecase;
  late MockRideOfferRepository mockRideOfferRepository;

  setUp(() {
    mockRideOfferRepository = MockRideOfferRepository();
    usecase = DropPassengerUseCase(mockRideOfferRepository);
  });

  final tRideOfferId = '123';

  test('should drop passenger from the ride offer from the repository',
      () async {
    // arrange
when(mockRideOfferRepository.dropPassenger(any))
    .thenAnswer((_) async => Right(true));
    // act
    final result = await usecase(tRideOfferId);
    // assert
    expect(result, Right(true));
    verify(mockRideOfferRepository.dropPassenger(tRideOfferId));
    verifyNoMoreInteractions(mockRideOfferRepository);
  });
}
