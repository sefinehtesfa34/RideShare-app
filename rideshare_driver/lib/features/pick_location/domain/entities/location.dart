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
 * `Location` is a class that extends `Equatable` to provide value equality.
 * It represents a geographical location with a latitude and longitude.
 *
 * It has two properties:
 * - `latitude`: A double representing the latitude of the location.
 * - `longitude`: A double representing the longitude of the location.
 *
 * The class has a constructor which requires these two properties.
 *
 * It also has two methods:
 * - `fromJson`: A factory constructor that creates a `Location` instance from a JSON object.
 * - `toJson`: A method that converts a `Location` instance into a JSON object.
 *
 * The `props` getter is used by `Equatable` to determine equality.
 */