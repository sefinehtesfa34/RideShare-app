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
}
