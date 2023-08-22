import '../../domain/entities/location.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/user.dart';

class PassengerModel extends RideOffer {
  PassengerModel({
    required User user,
    required Location currentLocation,
    required Location destination,
    required int seatsAllocated,
    required double price
  }) : super(
          user: user,
          currentLocation: currentLocation,
          destination: destination,
          seatsAllocated: seatsAllocated,
          price: price
        );

  factory PassengerModel.fromJson(Map<String, dynamic> json) => PassengerModel(
        price:(json['price'] ?? 0.0).toDouble(),
        // price: json['price'] ,
        user: User.fromJson(json["user"]),
        currentLocation: Location.fromJson(json['currentLocation']),
        destination: Location.fromJson(json['destination']),
        seatsAllocated: json['seatsAllocated'],
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'currentLocation': currentLocation.toJson(),
        'destination': destination.toJson(),
        'seatsAllocated': seatsAllocated,
        'price' : price,
      };
  static Map<String, dynamic> toJsonGivenPassenger(RideOffer passenger) {
    return {
      'user': passenger.user.toJson(),
      'currentLocation': passenger.currentLocation.toJson(),
      'destination': passenger.destination.toJson(),
      'seatsAllocated': passenger.seatsAllocated,
    };
  }
}

/// `passenger_model.dart`
///
/// This file defines the `PassengerModel` class which extends the `RideOffer` class.
/// It represents a passenger in the context of a ride offer.
///
/// The `PassengerModel` class has the following properties:
/// - `user`: The user who is the passenger.
/// - `currentLocation`: The current location of the passenger.
/// - `destination`: The destination of the passenger.
/// - `seatsAllocated`: The number of seats allocated to the passenger.
/// - `price`: The price of the ride for the passenger.
///
/// The `PassengerModel` class has the following methods:
/// - `PassengerModel.fromJson(Map<String, dynamic> json)`: A factory constructor that creates a `PassengerModel` instance from a map.
/// - `toJson()`: A method that converts the `PassengerModel` instance into a map.
/// - `toJsonGivenPassenger(RideOffer passenger)`: A static method that converts a given `RideOffer` instance into a map.
///
/// Example usage:
/// ```dart
/// var passenger = PassengerModel.fromJson(jsonData);
/// var passengerMap = passenger.toJson();
/// var passengerMapGivenRideOffer = PassengerModel.toJsonGivenPassenger(rideOfferInstance);
/// ```