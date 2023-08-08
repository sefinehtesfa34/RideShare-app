import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:rideshare/features/pick_location/domain/entities/location.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_offer.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_request.dart';
import 'package:rideshare/features/pick_location/domain/entities/user.dart';
import 'package:rideshare/features/pick_location/domain/repositories/ride_repository.dart';
import 'package:rideshare/features/pick_location/domain/usecases/ride_request_usecase.dart';
import 'cancel_ride_usecase_test.mocks.dart';

@GenerateMocks([RideRepository])
void main() {
  late GetRideRequestUseCase useCase;
  late MockRideRepository mockRepository;

  setUp(() {
    mockRepository = MockRideRepository();
    useCase = GetRideRequestUseCase(repository: mockRepository);
  });

  test('should return a stream of RideRequest', () async {
    // Arrange
    final passenger = RideOffer(
      user: User(
        fullname: 'John Doe', // provide the full name
        imageUrl: 'https://example.com/profile.jpg', // provide the image URL
        phoneNumber: '+1234567890', // provide the phone number
        age: 25, // provide the age
      ),
      currentLocation: Location(
        latitude: 37.7749, // provide the latitude
        longitude: -122.4194, // provide the longitude
      ),
      destination: Location(
        latitude: 34.0522, // provide the latitude
        longitude: -118.2437, // provide the longitude
      ),
      seatsAllocated: 2, // provide the number of seats allocated
      price: 10.0, // provide the price
    );
    final expectedStream = Stream<RideRequest>.empty();
    when(mockRepository.getRideRequest(passenger))
        .thenAnswer((_) async => Right(expectedStream));

    // Act
    final result = await useCase.call(passenger);

    // Assert
    expect(result, Right(expectedStream));
    verify(mockRepository.getRideRequest(passenger));
    verifyNoMoreInteractions(mockRepository);
  });
}
