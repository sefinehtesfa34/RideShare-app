import 'package:rideshare/features/feeds/domain/entity/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.cityName,
    required super.latitude,
    required super.longitude,
  });
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      cityName: json['cityName'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
