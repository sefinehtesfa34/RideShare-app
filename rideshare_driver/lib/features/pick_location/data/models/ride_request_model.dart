import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../../domain/entities/location.dart';
import 'passenger_model.dart';

class RideRequestModel extends RideRequest {
  RideRequestModel({
    required String driverName,
    required String driverImageURL,
    required double driverRatingAverageOutOf5,
    required int driverReviews,
    required String carModel,
    required int availableSeats,
    required String carImageURL,
    required String carPlateNumber,
    required String driverPhoneNumber,
    required Location carLocation,
    required Location destination,
    required List<RideOffer> passengersList,
  }) : super(
          driverName: driverName,
          driverImageURL: driverImageURL,
          driverRatingAverageOutOf5: driverRatingAverageOutOf5,
          driverReviews: driverReviews,
          carModel: carModel,
          availableSeats: availableSeats,
          carImageURL: carImageURL,
          carPlateNumber: carPlateNumber,
          driverPhoneNumber: driverPhoneNumber,
          carLocation: carLocation,
          passengersList: passengersList,
          destination: destination,
        );

  factory RideRequestModel.fromJson(Map<String, dynamic> json) {
    List<RideOffer> passList = [];
    for (final pass in json['passengersList']) {
      passList.add(PassengerModel.fromJson(pass));
    }
    return RideRequestModel(
        driverName: json['driver_name'],
        driverImageURL: json['driver_image_url'],
        driverRatingAverageOutOf5: json['driver_rating_average_out_of_5'],
        driverReviews: json['driver_reviews'],
        carModel: json['car_model'],
        availableSeats: json['available_seats'],
        carImageURL: json['car_image_url'],
        carPlateNumber: json['car_plate_number'],
        driverPhoneNumber: json['driver_phone_number'],
        carLocation: Location.fromJson(json['car_location']),
        destination: Location.fromJson(json['destination']),
        passengersList: passList);
  }

  Map<String, dynamic> toJson() {
    return {
      'driver_name': driverName,
      'driver_image_url': driverImageURL,
      'driver_rating_average_out_of_5': driverRatingAverageOutOf5,
      'driver_reviews': driverReviews,
      'car_model': carModel,
      'available_seats': availableSeats,
      'car_image_url': carImageURL,
      'car_plate_number': carPlateNumber,
      'driver_phone_number': driverPhoneNumber,
      'car_location': carLocation.toJson(),
    };
  }
}

/// `ride_request_model.dart`
/// 
/// This file contains the `RideRequestModel` class which extends the `RideRequest` class.
/// 
/// The `RideRequestModel` class is used to represent a ride request in the application.
/// It includes details about the driver, the car, the location of the car, the destination, and the list of passengers.
/// 
/// It also includes methods to convert the `RideRequestModel` object to and from a JSON object.
/// 
/// Fields:
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
/// - `passengersList`: The list of passengers in the ride.
/// 
/// Methods:
/// - `RideRequestModel.fromJson(Map<String, dynamic> json)`: A factory constructor that creates a `RideRequestModel` from a JSON object.
/// - `toJson()`: A method that converts the `RideRequestModel` object to a JSON object.