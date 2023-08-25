import 'package:equatable/equatable.dart';

import 'location.dart';
import 'user.dart';

class RideOffer extends Equatable {
  final User user;
  final Location currentLocation;
  final Location destination;
  final int seatsAllocated;
  final double price;

  RideOffer(
      {required this.user,
      required this.currentLocation,
      required this.destination,
      required this.seatsAllocated,
      required this.price});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = this.user.toJson();
    data['currentLocation'] = this.currentLocation.toJson();
    data['destination'] = this.destination.toJson();
    data['seatsAllocated'] = this.seatsAllocated;
    data['price'] = this.price;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [user, currentLocation, destination, seatsAllocated, price];
}

/**
 * `ride_offer.dart`
 * 
 * This file contains the `RideOffer` class, which extends the `Equatable` class.
 * 
 * The `RideOffer` class represents a ride offer made by a user. It contains the following properties:
 * - `user`: The user who is offering the ride.
 * - `currentLocation`: The current location of the user.
 * - `destination`: The destination of the ride.
 * - `seatsAllocated`: The number of seats allocated for the ride.
 * - `price`: The price of the ride.
 * 
 * The `RideOffer` class also includes a `toJson` method, which converts the `RideOffer` object into a map.
 * 
 * The `props` getter is used to determine whether two `RideOffer` objects are equal.
 */