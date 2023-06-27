import 'location.dart';
import 'user.dart';

class RideOffer {
  final String rideOfferId;
  final User user;
  final Location currentLocation;
  final Location destination;
  final int seatsAllocated;
  final double price;

  RideOffer(
      {
        required this.rideOfferId,
        required this.user,
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
    data['rideOfferId'] = this.rideOfferId;
    return data;
  }
}
