import 'package:equatable/equatable.dart';

/// Destination Entity
///
/// Represents a destination location with its name, latitude, and longitude.
class Destination extends Equatable {
  final String name;
  final double latitude;
  final double longitude;

  /// Creates a [Destination] instance with the provided [latitude], [longitude], and [name].
  const Destination({
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  /// A list of properties used for equality comparison.
  ///
  /// The properties included in the comparison are [name], [latitude], and [longitude].
  @override
  List<Object?> get props => [name, latitude, longitude];
}
