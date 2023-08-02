import 'package:equatable/equatable.dart';
class Destination extends Equatable{
  final String name;
  final double latitude;
  final double longitude;
  Destination({
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  @override
  List<Object?> get props => [name, latitude, longitude];
}
