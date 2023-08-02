import '../../domain/entities/destination.dart';

class DestinationModel extends Destination {
  DestinationModel({
    required double latitude,
    required double longitude,
    required String name,
  }) : super(latitude: latitude, longitude: longitude, name: name);

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    print("json $json");
    return DestinationModel(
      latitude: (json['latitude'] as double?) ?? 0.0,
      longitude: (json['longitude'] as double?) ?? 0.0,
      name: json['name'] as String? ?? '',
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
