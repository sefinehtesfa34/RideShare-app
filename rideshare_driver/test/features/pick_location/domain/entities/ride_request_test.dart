import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/domain/entities/location.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_offer.dart';
import 'package:rideshare/features/pick_location/domain/entities/ride_request.dart';
import 'package:rideshare/features/pick_location/domain/entities/user.dart';


void main() {
  group('RideRequest', () {
    test('should create a valid RideRequest object', () {
      final rideRequest = RideRequest(
        driverName: 'Jane Doe',
        driverImageURL: 'http://example.com/image.jpg',
        driverRatingAverageOutOf5: 4.5,
        driverReviews: 100,
        carModel: 'Tesla Model S',
        availableSeats: 4,
        carImageURL: 'http://example.com/car.jpg',
        carPlateNumber: 'ABC123',
        driverPhoneNumber: '1234567890',
        carLocation: Location(latitude: 0.0, longitude: 0.0),
        passengersList: [
          RideOffer(
            user: User(
              fullname: 'John Doe', // provide the full name
              imageUrl:
                  'http://example.com/profile.jpg', // provide the image URL
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
          ),
        ],
        destination: Location(latitude: 1.0, longitude: 1.0),
      );

      expect(rideRequest.driverName, 'Jane Doe');
      expect(rideRequest.driverImageURL, 'http://example.com/image.jpg');
      expect(rideRequest.driverRatingAverageOutOf5, 4.5);
      expect(rideRequest.driverReviews, 100);
      expect(rideRequest.carModel, 'Tesla Model S');
      expect(rideRequest.availableSeats, 4);
      expect(rideRequest.carImageURL, 'http://example.com/car.jpg');
      expect(rideRequest.carPlateNumber, 'ABC123');
      expect(rideRequest.driverPhoneNumber, '1234567890');
      expect(rideRequest.carLocation, Location(latitude: 0.0, longitude: 0.0));
      expect(rideRequest.passengersList[0].user.fullname, 'John Doe');
      expect(rideRequest.passengersList[0].user.imageUrl,
          'http://example.com/profile.jpg');
      expect(rideRequest.destination, Location(latitude: 1.0, longitude: 1.0));
    });
  });
}
