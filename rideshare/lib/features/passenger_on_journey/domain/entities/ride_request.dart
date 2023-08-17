import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_offer.dart';

import 'location.dart';

/// Ride Request Entity
///
/// Represents a ride request with details about the driver, car, available seats,
/// and a list of ride offers made by passengers.
class RideRequest {
  /// The name of the driver offering the ride.
  final String driverName;

  /// The URL to the driver's profile image.
  final String driverImageURL;

  /// The average rating of the driver out of 5.
  final double driverRatingAverageOutOf5;

  /// The model of the car.
  final String carModel;

  /// The number of available seats in the car.
  final int availableSeats;

  /// The URL to the car's image.
  final String carImageURL;

  /// The license plate number of the car.
  final String carPlateNumber;

  /// The phone number of the driver.
  final String driverPhoneNumber;

  /// The current location of the car.
  final Location carLocation;

  /// The list of ride offers made by passengers.
  List<RideOffer> passengersList;

  /// Constructs a [RideRequest] instance with the provided details.
  RideRequest({
    required this.driverName,
    required this.driverImageURL,
    required this.driverRatingAverageOutOf5,
    required this.carModel,
    required this.availableSeats,
    required this.carImageURL,
    required this.carPlateNumber,
    required this.driverPhoneNumber,
    required this.carLocation,
    required this.passengersList,
  });

  /// Factory constructor to create a [RideRequest] instance from JSON data.
  factory RideRequest.fromJson(Map<String, dynamic> json) {
    return RideRequest(
      driverName: json['driverName'],
      driverImageURL: json['driverImageURL'],
      driverRatingAverageOutOf5: json['driverRatingAverageOutOf5'],
      carModel: json['carModel'],
      availableSeats: json['availableSeats'],
      carImageURL: json['carImageURL'],
      carPlateNumber: json['carPlateNumber'],
      driverPhoneNumber: json['driverPhoneNumber'],
      carLocation: Location.fromJson(json['carLocation']),
      passengersList: List<RideOffer>.from(
        json['passengersList'].map((x) => RideOffer.fromJson(x)),
      ),
    );
  }
}
