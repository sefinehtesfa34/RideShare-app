import '../../domain/entities/destination.dart';

class DestinationModel extends Destination {
  final String name;

  DestinationModel({
    required this.name,
  }) : super(name: name);

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}
