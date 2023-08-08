import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_passengers/data/model/passenger_model.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/location.dart';
import 'package:rideshare/features/pick_passengers/domain/entity/user.dart';

void main() {
  group('RideOfferModel', () {
    final testRideOfferModel = RideOfferModel(
      rideOfferId: '77',
      user: User(
        fullname: 'Yared',
        imageUrl: "http",
        phoneNumber: '+251982985676',
        age: 22,
      ),
      currentLocation: Location(
        latitude: 9.023129270066768,
        longitude: 38.76396059989929,
      ),
      destination: Location(
        latitude: 9.029695130008125,
        longitude: 38.763623647391796,
      ),
      seatsAllocated: 1,
      price: 60.0,
      originAddress: 'origin address',
      destinationAddress: 'destination address',
      status: '0',
      accepted: false,
    );
    test('should be able to convert from JSON', () {
      final Map<String, dynamic> json = {
        'id': 77,
        'origin': {
          'latitude': 9.023129270066768,
          'longitude': 38.76396059989929,
        },
        'destination': {
          'latitude': 9.029695130008125,
          'longitude': 38.763623647391796,
        },
        'originAddress': 'origin address',
        'destinationAddress': 'destination address',
        'currentFare': 0,
        'status': 0,
        'numberOfSeats': 1,
        'user': {
          'roles': [],
          'fullName': 'Yared',
          'phoneNumber': '+251982985676',
          'age': 22,
          'statusByLogin': null,
          'profilePicture': 'http', // make sure this is null
        },
        'accepted': false,
      };

      expect(RideOfferModel.fromJson(json), testRideOfferModel);
    });
    test('should be able to convert to JSON', () {
      final Map<String, dynamic> json = {
        'user': testRideOfferModel.user.toJson(),
        'currentLocation': testRideOfferModel.currentLocation.toJson(),
        'destination': testRideOfferModel.destination.toJson(),
        'seatsAllocated': testRideOfferModel.seatsAllocated,
        'price': testRideOfferModel.price,
        'rideOfferId': testRideOfferModel.rideOfferId,
        'originAddress': testRideOfferModel.originAddress,
        'destinationAddress': testRideOfferModel.destinationAddress,
      };

      expect(testRideOfferModel.toJson(), json);
    });
  });
}
