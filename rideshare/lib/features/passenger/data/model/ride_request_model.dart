import 'package:rideshare/features/passenger/data/model/passenger_model.dart';

import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../../domain/entities/location.dart';

class RideRequestModel extends RideRequest {
  RideRequestModel({
    required String driverName,
    required String driverImageURL,
    required double driverRatingAverageOutOf5,
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
          carModel: carModel,
          availableSeats: availableSeats,
          carImageURL: carImageURL,
          carPlateNumber: carPlateNumber,
          driverPhoneNumber: driverPhoneNumber,
          carLocation: carLocation,
          passengersList: passengersList,
        );

  factory RideRequestModel.fromJson(Map<String, dynamic> json) {
    print("Changing model");
    List<RideOffer> passList = [];
    for (final pass in json['matches']) {
      print(pass);
      passList.add(PassengerModel.fromJson(pass));
    }
    print("pass finished");
    return RideRequestModel(
        driverName: json['driverName'],
        driverImageURL: json['driverImageUrl'],
        driverRatingAverageOutOf5: json['averageRate'],
        carModel: json['vehicleModel'],
        availableSeats: json['availableSeats'],
        carImageURL:
            "https://www.car-mart.com/wp-content/uploads/2021/04/homepage-jeep.png",
        carPlateNumber: json['vehiclePlateNumber'],
        driverPhoneNumber: json['driverPhoneNumber'],
        carLocation: Location.fromJson(json['currentLocation']),
        passengersList: passList);
  }

  Map<String, dynamic> toJson() {
    return {
      'driver_name': driverName,
      'driver_image_url': driverImageURL,
      'driver_rating_average_out_of_5': driverRatingAverageOutOf5,
      'car_model': carModel,
      'available_seats': availableSeats,
      'car_image_url': carImageURL,
      'car_plate_number': carPlateNumber,
      'driver_phone_number': driverPhoneNumber,
      'car_location': carLocation.toJson(),
    };
  }
}
