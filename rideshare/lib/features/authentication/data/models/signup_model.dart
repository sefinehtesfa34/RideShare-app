import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';

class SignupPayloadModel extends SignupPayload {
  const SignupPayloadModel({
    required super.fullName,
    required super.age,
    required super.idImage,
  });
  factory SignupPayloadModel.fromJson(Map<String, dynamic> json) {
    return SignupPayloadModel(
      fullName: json['fullName'],
      age: json['age'],
      idImage: json['idImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullName': fullName,
      'age': age,
      'id': idImage,
    };
  }
}
