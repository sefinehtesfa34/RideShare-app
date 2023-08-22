import 'package:equatable/equatable.dart';

class Destination extends Equatable{
  final String name;
  final double latitude;
  final double longitude;
  const Destination({
    required this.latitude,
    required this.longitude,
    required this.name,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, latitude, longitude];
}

/// `destination.dart`
/// 
/// This file contains the `Destination` class which extends `Equatable`.
/// 
/// `Destination` is a class that represents a geographical location with a name, latitude, and longitude.
/// 
/// Fields:
/// - `name`: A `String` that represents the name of the destination.
/// - `latitude`: A `double` that represents the latitude of the destination.
/// - `longitude`: A `double` that represents the longitude of the destination.
/// 
/// Constructor:
/// - The constructor requires all fields to be passed as arguments.
/// 
/// Methods:
/// - `props`: Overrides the `props` getter from `Equatable` to provide a list of properties used for comparison.
/// 
/// Example:
/// ```dart
/// const Destination({
///   required this.latitude,
///   required this.longitude,
///   required this.name,
/// });
/// ```
/// 
/// Usage:
/// ```dart
/// var destination = Destination(
///   name: 'Paris',
///   latitude: 48.8566,
///   longitude: 2.3522,
/// );
/// ```