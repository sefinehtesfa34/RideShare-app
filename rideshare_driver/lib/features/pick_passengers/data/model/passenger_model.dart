import '../../domain/entity/location.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/entity/user.dart';

class RideOfferModel extends RideOffer {
  RideOfferModel(

      {required String rideOfferId,
        required User user,
      required Location currentLocation,
      required Location destination,
      required int seatsAllocated,
      required double price})
      : super(
            rideOfferId: rideOfferId,
            user: user,
            currentLocation: currentLocation,
            destination: destination,
            seatsAllocated: seatsAllocated,
            price: price);

  factory RideOfferModel.fromJson(Map<String, dynamic> json) {

    final user = User.fromJson(json["user"]);
    final curLoc = Location.fromJson(json['currentLocation']);
    final dest = Location.fromJson(json['destination']);
    final model = RideOfferModel(
      rideOfferId: json['rideOfferId'],
      price: double.parse(json['price'].toString()),
      user: user,
      currentLocation: curLoc,
      destination: dest,
      seatsAllocated: json['seatsAllocated'],
    );
    return model;
  }

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'currentLocation': currentLocation.toJson(),
        'destination': destination.toJson(),
        'seatsAllocated': seatsAllocated,
        'price': price,
        'rideOfferId' : rideOfferId
      };
  static Map<String, dynamic> toJsonGivenPassenger(RideOffer passenger) {
    return {
      'user': passenger.user.toJson(),
      'currentLocation': passenger.currentLocation.toJson(),
      'destination': passenger.destination.toJson(),
      'seatsAllocated': passenger.seatsAllocated,
      'rideOfferId': passenger.rideOfferId
    };
  }
}
