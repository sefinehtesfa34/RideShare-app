import 'package:rideshare/features/feeds/profile/domain/entity/passenger.dart';

class PassengerModel extends Passenger {
  const PassengerModel({super.age, super.fullName});
  factory PassengerModel.fromJson(Map<String, dynamic> json) {
    return PassengerModel(age: json['age'], fullName: json['fullName']);
  }
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'fullName': fullName,
    };
  }
}
