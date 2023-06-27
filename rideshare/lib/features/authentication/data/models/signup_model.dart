import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';

class SignupPayloadModel extends SignupPayload {
  const SignupPayloadModel({
    required super.fullName,
    required super.age,
    super.imageId,
    required super.phoneNumber,
    required super.id,
    required super.name,
  });
  factory SignupPayloadModel.fromJson(Map<String, dynamic> json) {
    return SignupPayloadModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      fullName: json['fullName'],
      age: json['age'],
      imageId: json['imageId'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullName': fullName,
      'age': age,
      'imageId': imageId,
      'name': name,
      'id': id,
      'phoneNumber': phoneNumber,
    };
  }
}

class VerifyOtpModel {
  final String otp;
  final bool signedUp;

  const VerifyOtpModel({required this.otp, required this.signedUp});
  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(otp: json['otp'], signedUp: json['signedUp']);
  }
  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'signedUp': signedUp,
    };
  }
}
