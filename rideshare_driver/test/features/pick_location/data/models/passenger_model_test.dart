import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/data/models/passenger_model.dart';
import 'package:rideshare/features/pick_location/domain/entities/location.dart';
import 'package:rideshare/features/pick_location/domain/entities/user.dart';

void main() {
  group('PassengerModel', () {
    test('toJson should return a valid JSON map', () {
      // Arrange
      final passenger = PassengerModel(
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
        price: 10.0,
      );

      // Act
      final json = passenger.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['user'], isA<Map<String, dynamic>>());
      expect(json['currentLocation'], isA<Map<String, dynamic>>());
      expect(json['destination'], isA<Map<String, dynamic>>());
      expect(json['seatsAllocated'], equals(2));
      expect(json['price'], equals(10.0));
    });
  });
}
