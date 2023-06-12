import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';

class SignupPayloadModel extends SignupPayload {
  const SignupPayloadModel({
    required super.fullName,
    required super.phoneNumber,
    required super.sex,
    required super.age,
    required super.id,
  });
  factory SignupPayloadModel.fromJson(Map<String, dynamic> json) {
    return SignupPayloadModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      sex: json['sex'],
      age: json['age'],
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'sex': sex,
      'age': age,
      'id': id
    };
  }
}
