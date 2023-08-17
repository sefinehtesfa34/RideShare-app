/// Location Model
///
/// Represents a geographical location with latitude and longitude.
class Location {
  /// The latitude value of the location.
  final double latitude;

  /// The longitude value of the location.
  final double longitude;

  /// Constructs a [Location] instance with the provided [latitude] and [longitude].
  const Location({required this.latitude, required this.longitude});

  /// Factory constructor to create a [Location] instance from JSON data.
  factory Location.fromJson(dynamic json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  /// Converts the [Location] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
