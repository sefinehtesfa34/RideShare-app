import '../../domain/entities/location.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/user.dart';

/// Passenger Model
///
/// Represents a passenger's ride offer, extending the [RideOffer] class.
/// It provides methods for converting to and from JSON format.
class PassengerModel extends RideOffer {
  /// Creates a [PassengerModel] instance with the provided attributes.
  ///
  /// The constructor parameters correspond to the attributes of a ride offer
  /// and are inherited from the parent [RideOffer] class.
  PassengerModel({
    required String rideOfferId,
    required User user,
    required Location currentLocation,
    required Location destination,
    required int seatsAllocated,
    required double price,
    required String originAddress,
    required String destinationAddress,
    required String status,
    required bool accepted,
  }) : super(
          rideOfferId: rideOfferId,
          user: user,
          currentLocation: currentLocation,
          destination: destination,
          seatsAllocated: seatsAllocated,
          price: price,
          originAddress: originAddress,
          destinationAddress: destinationAddress,
          accepted: accepted,
          status: status,
        );

  /// Creates a [PassengerModel] instance from a JSON map.
  ///
  /// The [json] parameter should be a map containing the ride offer details
  /// in the format specified in the example JSON map provided in the code comments.
  factory PassengerModel.fromJson(Map<String, dynamic> json) {
    final curLoc = Location.fromJson(json['origin']);
    final dest = Location.fromJson(json['destination']);
    final user = User.fromJson(json['user']);
    final model = PassengerModel(
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
    return model;
  }

  /// Converts the [PassengerModel] instance to a JSON map.
  ///
  /// Returns a map containing the attributes of the ride offer in JSON format.
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

  /// Converts a [RideOffer] instance into a JSON map for a passenger.
  ///
  /// This static method takes a [RideOffer] instance and creates a JSON map
  /// containing only the attributes relevant to a passenger's ride offer.
  static Map<String, dynamic> toJsonGivenPassenger(RideOffer passenger) {
    return {
      'user': passenger.user.toJson(),
      'currentLocation': passenger.currentLocation.toJson(),
      'destination': passenger.destination.toJson(),
      'seatsAllocated': passenger.seatsAllocated,
      'rideOfferId': passenger.rideOfferId,
    };
  }
}
