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
      required double price,
      required String originAddress,
      required String destinationAddress,
      required String status,
      required bool accepted})
      : super(
            rideOfferId: rideOfferId,
            user: user,
            currentLocation: currentLocation,
            destination: destination,
            seatsAllocated: seatsAllocated,
            price: price,
            originAddress: originAddress,
            destinationAddress: destinationAddress,
            accepted: accepted,
            status: status);

  factory RideOfferModel.fromJson(Map<String, dynamic> json) {
//     {
//   'id': 77,
//   'origin': {
//     'latitude': 9.023129270066768,
//     'longitude': 38.76396059989929,
//   },
//   'destination': {
//     'latitude': 9.029695130008125,
//     'longitude': 38.763623647391796,
//   },
//   'originAddress': 'መናሃሪያ ካዛንቺስ Menahereya Kazanchis, Addis Ababa, Ethiopia',
//   'destinationAddress': 'አራት ኪሎ / Arat Kilo, Addis Ababa, Ethiopia',
//   'currentFare': 0,
//   'status': 0,
//   'numberOfSeats': 1,
//   'user': {
//     'roles': [],
//     'fullName': 'Yared',
//     'phoneNumber': '+251982985676',
//     'age': 22,
//     'statusByLogin': null,
//     'profilePicture': null,
//   },
//   'accepted': false,
// };

    final curLoc = Location.fromJson(json['origin']);
    print("curLocation set");
    final dest = Location.fromJson(json['destination']);
    print("destination found");
    final user = User.fromJson(json['user']);
    print("user found ");
    final model = RideOfferModel(
      rideOfferId: json['id'].toString(),
      price: double.parse(json["currentFare"].toString()),
      user: user,
      currentLocation: curLoc,
      destination: dest,
      seatsAllocated: json["numberOfSeats"],
      originAddress: json["originAddress"],
      destinationAddress: json["destinationAddress"],
      status: json["status"].toString(),
      accepted: json["accepted"],
    );
    print("passed everything");
    return model;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user.toJson();
    data['currentLocation'] = currentLocation.toJson();
    data['destination'] = destination.toJson();
    data['seatsAllocated'] = seatsAllocated;
    data['price'] = price;
    data['rideOfferId'] = rideOfferId;
    data['originAddress'] = originAddress;
    data['destinationAddress'] = destinationAddress;
    return data;
  }

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
