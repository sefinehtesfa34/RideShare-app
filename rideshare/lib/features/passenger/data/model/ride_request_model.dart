import 'package:rideshare/features/passenger/data/model/passenger_model.dart';

import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../../domain/entities/location.dart';

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
