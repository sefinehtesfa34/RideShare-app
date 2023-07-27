import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_offer.dart';

import 'location.dart';

class RideRequest {
  final String driverName;
  final String driverImageURL;
  final double driverRatingAverageOutOf5;
  final String carModel;
  final int availableSeats;
  final String carImageURL;
  final String carPlateNumber;
  final String driverPhoneNumber;
  final Location carLocation;
  List<RideOffer> passengersList;

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
}
