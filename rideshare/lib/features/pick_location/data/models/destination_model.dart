import '../../domain/entities/destination.dart';

/// Destination Model
///
/// Represents a model class that extends the [Destination] entity.
/// This model class is used for serialization and deserialization of destination data.
class DestinationModel extends Destination {
  /// Creates a [DestinationModel] instance with the provided [latitude], [longitude], and [name].
  ///
  /// This constructor is used for creating instances of [DestinationModel].
  /// It extends the properties from the [Destination] entity class.
  DestinationModel({
    required double latitude,
    required double longitude,
    required String name,
  }) : super(latitude: latitude, longitude: longitude, name: name);

  /// Creates a [DestinationModel] instance from a JSON map.
  ///
  /// The [json] parameter should be a valid JSON map containing 'name', 'latitude',
  /// and 'longitude' properties. If any of these properties are missing or not of the
  /// expected type, default values are used.
  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      latitude: (json['latitude'] as double?) ?? 0.0,
      longitude: (json['longitude'] as double?) ?? 0.0,
      name: json['name'] as String? ?? '',
    );
  }

  /// Converts a [DestinationModel] instance into a JSON map.
  ///
  /// Returns a JSON map representation of the destination with 'name', 'latitude',
  /// and 'longitude' properties.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
