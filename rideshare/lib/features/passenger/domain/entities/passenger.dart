import 'location.dart';

class Passenger {
  final String imageUrl;
  final String name;
  final Location currentLocation;
  final Location destination;
  final int seatsAllocated;

  Passenger({
    required this.imageUrl,
    required this.name,
    required this.currentLocation,
    required this.destination,
    required this.seatsAllocated,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['currentLocation'] = this.currentLocation.toJson();
    data['destination'] = this.destination.toJson();
    data['seatsAllocated'] = this.seatsAllocated;
    return data;
  }

  
}
