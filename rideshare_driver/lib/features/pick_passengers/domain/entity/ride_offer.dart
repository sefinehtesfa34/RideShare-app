import 'package:equatable/equatable.dart';

import 'location.dart';
import 'user.dart';

class RideOffer extends Equatable {
  final String rideOfferId;
  final String originAddress;
  final String destinationAddress;
  final User user;
  final Location currentLocation;
  final Location destination;
  final int seatsAllocated;
  final double price;
  final String status;
  final bool accepted;

  RideOffer(
      {required this.accepted,
      required this.originAddress,
      required this.destinationAddress,
      required this.user,
      required this.status,
      required this.rideOfferId,
      required this.currentLocation,
      required this.destination,
      required this.seatsAllocated,
      required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [
        rideOfferId,
        originAddress,
        destinationAddress,
        user,
        currentLocation,
        destination,
        seatsAllocated,
        price,
        status,
        accepted
      ];
}
/// `RideOffer` is a class that represents a ride offer in the ride-sharing application.
/// Each ride offer has the following properties:
/// 
/// `rideOfferId`: A unique identifier for the ride offer.
/// 
/// `originAddress`: The starting address of the ride.
/// 
/// `destinationAddress`: The ending address of the ride.
/// 
/// `user`: The user who is offering the ride.
/// 
/// `currentLocation`: The current location of the user.
/// 
/// `destination`: The destination location of the ride.
/// 
/// `seatsAllocated`: The number of seats allocated for the ride.
/// 
/// `price`: The price of the ride.
/// 
/// `status`: The status of the ride offer (e.g., pending, accepted, rejected).
/// 
/// `accepted`: A boolean indicating whether the ride offer has been accepted or not.
/// 
/// The `RideOffer` class extends the `Equatable` class to allow for value comparison.
/// 
/// The `props` getter is used to determine equality. It returns a list of properties
/// that should be considered when determining whether two `RideOffer` instances are equal.