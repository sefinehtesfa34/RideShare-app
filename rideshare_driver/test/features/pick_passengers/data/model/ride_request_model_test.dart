import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_passengers/data/model/ride_request_model.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/location.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/ride_request.dart';

void main() {
  group('RideRequestModel', () {
    final testRideRequestModel = RideRequestModel(
      driverName: 'Test Driver',
      driverImageURL: 'http://test.com/driver.jpg',
      driverRatingAverageOutOf5: 4.5,
      driverReviews: 100,
      carModel: 'Test Car',
      availableSeats: 4,
      carImageURL: 'http://test.com/car.jpg',
      carPlateNumber: 'TEST123',
      driverPhoneNumber: '1234567890',
      carLocation: Location(latitude: 0.0, longitude: 0.0),
      destination: Location(latitude: 1.0, longitude: 1.0),
      passengersList: [],
    );

    test('should be a subclass of RideRequest entity', () {
      expect(testRideRequestModel, isA<RideRequest>());
    });

    test('fromJson should return a valid model', () {
      final Map<String, dynamic> jsonMap = {
        'driver_name': 'Test Driver',
        'driver_image_url': 'http://test.com/driver.jpg',
        'driver_rating_average_out_of_5': 4.5,
        'driver_reviews': 100,
        'car_model': 'Test Car',
        'available_seats': 4,
        'car_image_url': 'http://test.com/car.jpg',
        'car_plate_number': 'TEST123',
        'driver_phone_number': '1234567890',
        'car_location': {'latitude': 0.0, 'longitude': 0.0},
        'destination': {'latitude': 1.0, 'longitude': 1.0},
        'passengersList': [],
      };

      expect(RideRequestModel.fromJson(jsonMap), testRideRequestModel);
    });

    test('toJson should return a JSON map containing the proper data', () {
      final Map<String, dynamic> expectedMap = {
        'driver_name': 'Test Driver',
        'driver_image_url': 'http://test.com/driver.jpg',
        'driver_rating_average_out_of_5': 4.5,
        'driver_reviews': 100,
        'car_model': 'Test Car',
        'available_seats': 4,
        'car_image_url': 'http://test.com/car.jpg',
        'car_plate_number': 'TEST123',
        'driver_phone_number': '1234567890',
        'car_location': {'latitude': 0.0, 'longitude': 0.0},
    
      };

      expect(testRideRequestModel.toJson(), expectedMap);
    });
  });
}