import 'package:equatable/equatable.dart';

import 'location.dart';
import 'ride_offer.dart';

class RideRequest extends Equatable {
  final String driverName;
  final String driverImageURL;
  final double driverRatingAverageOutOf5;
  final int driverReviews;
  final String carModel;
  final int availableSeats;
  final String carImageURL;
  final String carPlateNumber;
  final String driverPhoneNumber;
  final Location carLocation;
  final Location destination;
  List<RideOffer> passengersList;

  RideRequest({
    required this.driverName,
    required this.driverImageURL,
    required this.driverRatingAverageOutOf5,
    required this.driverReviews,
    required this.carModel,
    required this.availableSeats,
    required this.carImageURL,
    required this.carPlateNumber,
    required this.driverPhoneNumber,
    required this.carLocation,
    required this.passengersList,
    required this.destination,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        driverName,
        driverImageURL,
        driverRatingAverageOutOf5,
        driverReviews,
        carModel,
        availableSeats,
        carImageURL,
        carPlateNumber,
        driverPhoneNumber,
        carLocation,
        destination,
        passengersList
      ];
}

/// `ride_request.dart`
/// 
/// This file defines the `RideRequest` class, which represents a ride request in the system.
/// 
/// A `RideRequest` object includes the following properties:
/// 
/// - `driverName`: The name of the driver.
/// - `driverImageURL`: The URL of the driver's image.
/// - `driverRatingAverageOutOf5`: The average rating of the driver out of 5.
/// - `driverReviews`: The number of reviews the driver has received.
/// - `carModel`: The model of the car.
/// - `availableSeats`: The number of available seats in the car.
/// - `carImageURL`: The URL of the car's image.
/// - `carPlateNumber`: The plate number of the car.
/// - `driverPhoneNumber`: The phone number of the driver.
/// - `carLocation`: The current location of the car.
/// - `destination`: The destination of the ride.
/// - `passengersList`: The list of passengers who have been offered the ride.
/// 
/// The `RideRequest` class extends the `Equatable` class to allow for value comparison.
/// 
/// The `props` getter is used to define the properties that will be used for comparison.