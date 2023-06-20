import '../../domain/entities/location.dart';
import '../../domain/entities/passenger.dart';

class PassengerModel extends Passenger {
  PassengerModel({
    required String imageUrl,
    required String name,
    required Location currentLocation,
    required Location destination,
    required int seatsAllocated,
  }) : super(
          imageUrl: imageUrl,
          name: name,
          currentLocation: currentLocation,
          destination: destination,
          seatsAllocated: seatsAllocated,
        );

  factory PassengerModel.fromJson(Map<String, dynamic> json) => PassengerModel(
        imageUrl: json['imageUrl'],
        name: json['name'],
        currentLocation: json['currentLocation'],
        destination: json['destination'],
        seatsAllocated: json['seatsAllocated'],
      );

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'name': name,
        'currentLocation': Location.fromJson(currentLocation),
        'destination': Location.fromJson(destination),
        'seatsAllocated': seatsAllocated,
      };
  static Map<String, dynamic> toJsonGivenPassenger(Passenger passenger) {
    return {
      'imageUrl': passenger.imageUrl,
      'name': passenger.name,
      'currentLocation': passenger.currentLocation,
      'destination': passenger.destination,
      'seatsAllocated': passenger.seatsAllocated,
    };
  }
}
