import '../../domain/entity/passenger.dart';

class PassengerModel extends Passenger {
  const PassengerModel({super.age, super.fullName, super.phoneNumber});
  factory PassengerModel.fromJson(Map<String, dynamic> json) {
    return PassengerModel(age: json['age'], fullName: json['fullName'], phoneNumber: json['phoneNumber']);
  }
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'fullName': fullName,
      'phoneNumber':phoneNumber
    };
  }
}
