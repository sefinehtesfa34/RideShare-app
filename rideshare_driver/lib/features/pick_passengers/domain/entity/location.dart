import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(dynamic json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [latitude, longitude];
}

/**
 * `Location` is a class that represents a geographical location with latitude and longitude.
 * 
 * It extends the `Equatable` class to override the equality operator for comparing instances of `Location`.
 * 
 * Properties:
 * - `latitude`: A double representing the latitude of the location.
 * - `longitude`: A double representing the longitude of the location.
 * 
 * Constructor:
 * - The constructor requires `latitude` and `longitude` as parameters.
 * 
 * Factory constructor:
 * - `fromJson(dynamic json)`: A factory constructor that creates a `Location` instance from a JSON object. 
 *   The JSON object should have `latitude` and `longitude` keys with their respective values.
 * 
 * Methods:
 * - `toJson()`: Returns a Map<String, dynamic> representation of the `Location` instance.
 * - `props`: Overrides the `props` getter from `Equatable` to provide a list of properties (`latitude` and `longitude`) 
 *   used for equality comparison.
 */