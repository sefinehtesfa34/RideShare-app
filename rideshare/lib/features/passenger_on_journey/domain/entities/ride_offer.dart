import 'package:rideshare/features/passenger_on_journey/domain/entities/user.dart';

import 'location.dart';

/// Ride Offer Entity
///
/// Represents a ride offer provided by a user, including details such as the origin and destination addresses,
/// user information, current and destination locations, allocated seats, price, status, and acceptance status.
class RideOffer {
  /// The unique identifier for the ride offer.
  final String rideOfferId;

  /// The address of the origin location.
  final String originAddress;

  /// The address of the destination location.
  final String destinationAddress;

  /// The user offering the ride.
  final User user;

  /// The current location of the ride.
  final Location currentLocation;

  /// The destination location of the ride.
  final Location destination;

  /// The number of seats allocated for the ride.
  final int seatsAllocated;

  /// The price of the ride.
  final double price;

  /// The status of the ride.
  final String status;

  /// Indicates whether the ride offer has been accepted.
  final bool accepted;

  /// Constructs a [RideOffer] instance with the provided details.
  RideOffer({
    required this.accepted,
    required this.originAddress,
    required this.destinationAddress,
    required this.user,
    required this.status,
    required this.rideOfferId,
    required this.currentLocation,
    required this.destination,
    required this.seatsAllocated,
    required this.price,
  });

  /// Factory constructor to create a [RideOffer] instance from JSON data.
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

