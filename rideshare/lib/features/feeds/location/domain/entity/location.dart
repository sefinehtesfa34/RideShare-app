import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String cityName;
  final double latitude;
  final double longitude;
  const Location(
      {required this.cityName,
      required this.latitude,
      required this.longitude});
      
        @override
        List<Object?> get props => [cityName, latitude, longitude];
}

