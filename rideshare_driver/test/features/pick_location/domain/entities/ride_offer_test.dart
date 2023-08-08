import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/domain/entities/location.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_offer.dart';
import 'package:rideshare/features/pick_location/domain/entities/user.dart';

void main() {
  group('RideOffer', () {
    final testUser = User(
      fullname: 'John Doe', // provide the full name
      imageUrl: 'https://example.com/profile.jpg', // provide the image URL
      phoneNumber: '+1234567890', // provide the phone number
      age: 25, // provide the age
    );
    final testLocation1 = Location(latitude: 40.7128, longitude: 74.0060);
    final testLocation2 = Location(latitude: 34.0522, longitude: 118.2437);
    final testRideOffer = RideOffer(
      user: testUser,
      currentLocation: testLocation1,
      destination: testLocation2,
      seatsAllocated: 2, // provide the number of seats allocated
      price: 50.0, // provide the price
    );

    test('should correctly convert to JSON', () {
      final result = testRideOffer.toJson();

      expect(result, {
        'user': testUser.toJson(),
        'currentLocation': testLocation1.toJson(),
        'destination': testLocation2.toJson(),
        'seatsAllocated': 2,
        'price': 50.0,
      });
    });
  });
}
