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
