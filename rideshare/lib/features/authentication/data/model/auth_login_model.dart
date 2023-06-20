
import '../../domain/entities/login_payload.dart';

class AuthLoginModel extends LoginPayload{
    const AuthLoginModel({required super.phoneNumber});

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginModel(
        phoneNumber: json["phoneNumber"]);
  }

  Map<String, dynamic> toJson() {
    return {"phoneNumber": phoneNumber};
  }

}