import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/location.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/ride_offer.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/ride_request.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/user.dart';
import 'package:rideshare/features/pick_passengers/domain/repository/ride_offer.dart';
import 'package:rideshare/features/pick_passengers/domain/usecase/get_ride_offers_usecase.dart';

import 'add_passenger_usecase_test.mocks.dart';

@GenerateMocks([RideOfferRepository])
void main() {
  late GetRideOffersUseCase usecase;
  late MockRideOfferRepository mockRideOfferRepository;

  setUp(() {
    mockRideOfferRepository = MockRideOfferRepository();
    usecase = GetRideOffersUseCase(mockRideOfferRepository);
  });

  final tRideRequest = RideRequest(
    driverName: 'John Doe',
    driverImageURL: 'https://example.com/image.jpg',
    driverRatingAverageOutOf5: 4.5,
    driverReviews: 100,
    carModel: 'Tesla Model S',
    availableSeats: 3,
    carImageURL: 'https://example.com/car.jpg',
    carPlateNumber: 'XYZ 1234',
    driverPhoneNumber: '1234567890',
    carLocation: Location(latitude: 40.7128, longitude: 74.0060), // New York
    passengersList: [],
    destination:
        Location(latitude: 34.0522, longitude: 118.2437), // Los Angeles
  );
  final tRideOffers = Stream.value([
    RideOffer(
      accepted: true, // provide the accepted status
      originAddress: '123 Main St, New York, NY', // provide the origin address
      destinationAddress:
          '456 Elm St, Los Angeles, CA', // provide the destination address
      user: User(
        fullname: 'John Doe', // provide the full name
        imageUrl: 'https://example.com/profile.jpg', // provide the image URL
        phoneNumber: '+1234567890', // provide the phone number
        age: 25, // provide the age
      ),
      status: 'Pending', // provide the status
      rideOfferId: 'RO123', // provide the ride offer ID
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
    ),
  ]);

  test('should get ride offers from the repository', () async {
    // arrange
    when(mockRideOfferRepository.getRideOffers(any))
        .thenAnswer((_) async => Right(tRideOffers));
    // act
    final result = await usecase(tRideRequest);
    // assert
    expect(result, Right(tRideOffers));
    verify(mockRideOfferRepository.getRideOffers(tRideRequest));
    verifyNoMoreInteractions(mockRideOfferRepository);
  });
}
