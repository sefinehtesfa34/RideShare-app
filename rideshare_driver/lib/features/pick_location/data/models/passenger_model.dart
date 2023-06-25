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
        price: json['price'],
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
