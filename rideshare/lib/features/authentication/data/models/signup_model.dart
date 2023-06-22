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
