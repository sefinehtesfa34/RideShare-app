import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/data/models/ride_request_model.dart';

void main() {
  group('RideRequestModel', () {
    test('fromJson should correctly parse JSON data', () {
      // Arrange
      final json = {
        'driver_name': 'John Doe',
        'driver_image_url': 'https://example.com/driver.jpg',
        'driver_rating_average_out_of_5': 4.5,
        'driver_reviews': 10,
        'car_model': 'Toyota Camry',
        'available_seats': 3,
        'car_image_url': 'https://example.com/car.jpg',
        'car_plate_number': 'ABC123',
        'driver_phone_number': '1234567890',
        'car_location': {
          'latitude': 37.7749,
          'longitude': -122.4194,
        },
        'destination': {
          'latitude': 37.7749,
          'longitude': -122.4194,
        },
        'passengersList': [
          {
            'user': {
              'fullname': 'Jane Smith',
              'imageUrl': 'https://example.com/passenger.jpg',
              'phoneNumber': '7987973973',
              'age': 23,
            },
            'price': 45.3,
            'seatsAllocated': 2,
            'currentLocation': {
              'latitude': 37.7749,
              'longitude': -122.4194,
            },
            'destination': {
              'latitude': 37.7749,
              'longitude': -122.4194,
            },
          },
          {
            'user': {
              'fullname': 'Bob Johnson',
              'imageUrl': 'https://example.com/passenger.jpg',
              'phoneNumber': '7987973973',
              'age': 23,
            },
            'price': 45.3,
            'seatsAllocated': 2,
            'currentLocation': {
              'latitude': 37.7749,
              'longitude': -122.4194,
            },
            'destination': {
              'latitude': 37.7749,
              'longitude': -122.4194,
            },
          },
        ],
      };

      // Act
      final rideRequest = RideRequestModel.fromJson(json);

      // Assert
      expect(rideRequest.driverName, 'John Doe');
      expect(rideRequest.driverImageURL, 'https://example.com/driver.jpg');
      expect(rideRequest.driverRatingAverageOutOf5, 4.5);
      expect(rideRequest.driverReviews, 10);
      expect(rideRequest.carModel, 'Toyota Camry');
      expect(rideRequest.availableSeats, 3);
      expect(rideRequest.carImageURL, 'https://example.com/car.jpg');
      expect(rideRequest.carPlateNumber, 'ABC123');
      expect(rideRequest.driverPhoneNumber, '1234567890');
      expect(rideRequest.carLocation.latitude, 37.7749);
      expect(rideRequest.carLocation.longitude, -122.4194);
      expect(rideRequest.destination.latitude, 37.7749);
      expect(rideRequest.destination.longitude, -122.4194);
      expect(rideRequest.passengersList.length, 2);
      expect(rideRequest.passengersList[0].user.fullname, 'Jane Smith');
      expect(rideRequest.passengersList[0].user.imageUrl,
          'https://example.com/passenger.jpg');
      expect(rideRequest.passengersList[1].user.fullname, 'Bob Johnson');
      expect(rideRequest.passengersList[1].user.imageUrl,
          'https://example.com/passenger.jpg');
    });
  });
}
