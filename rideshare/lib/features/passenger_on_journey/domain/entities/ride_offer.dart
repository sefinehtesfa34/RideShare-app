import 'package:rideshare/features/passenger_on_journey/domain/entities/user.dart';

import 'location.dart';

class RideOffer {
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

  factory RideOffer.fromJson(Map<String, dynamic> json) {
  return RideOffer(
    rideOfferId: json['rideOfferId'],
    originAddress: json['originAddress'],
    destinationAddress: json['destinationAddress'],
    user: User.fromJson(json['user']),
    currentLocation: Location.fromJson(json['currentLocation']),
    destination: Location.fromJson(json['destination']),
    seatsAllocated: json['seatsAllocated'],
    price: json['price'],
    status: json['status'],
    accepted: json['accepted'],
  );
}

}
