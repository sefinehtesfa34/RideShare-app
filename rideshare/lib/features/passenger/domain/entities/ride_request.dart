import 'location.dart';

class RideRequest {
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

  RideRequest(
     {
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
  });
}
