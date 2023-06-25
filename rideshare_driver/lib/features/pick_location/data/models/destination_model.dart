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
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
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
