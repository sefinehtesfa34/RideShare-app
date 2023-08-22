import '../../domain/entities/destination.dart';

class DestinationModel extends Destination {
  DestinationModel({
    required double latitude,
    required double longitude,
    required String name,
  }) : super(latitude: latitude, longitude: longitude, name: name);

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      latitude: (json['latitude'] as double?) ?? 0.0,
      longitude: (json['longitude'] as double?) ?? 0.0,
      name: (json['name'] as String?) ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
/**
 * `DestinationModel` is a data class that extends the `Destination` entity.
 * It represents a destination with a latitude, longitude, and name.
 *
 * It includes methods for creating a `DestinationModel` instance from a JSON object,
 * and for converting a `DestinationModel` instance into a JSON object.
 *
 * Constructor:
 * `DestinationModel({required double latitude, required double longitude, required String name})`
 * - `latitude`: The latitude of the destination. It is a required parameter.
 * - `longitude`: The longitude of the destination. It is a required parameter.
 * - `name`: The name of the destination. It is a required parameter.
 *
 * Factory constructor:
 * `DestinationModel.fromJson(Map<String, dynamic> json)`
 * - `json`: The JSON object from which to create a `DestinationModel` instance.
 *
 * Method:
 * `Map<String, dynamic> toJson()`
 * - Returns a JSON object that represents the `DestinationModel` instance.
 */