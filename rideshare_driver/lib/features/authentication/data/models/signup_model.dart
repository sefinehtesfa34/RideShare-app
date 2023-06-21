import '../../domain/entities/signup_payload.dart';

class SignupPayloadModel extends SignupPayload {
  const SignupPayloadModel({
    required super.fullName,
    required super.age,
    required super.idImage,
    required super.address,
    required super.driverLicenseNumber,
    required super.licenseImage,
    required super.experienceYear,
  });
  factory SignupPayloadModel.fromJson(Map<String, dynamic> json) {
    return SignupPayloadModel(
      fullName: json['fullName'],
      age: json['age'],
      idImage: json['idImage'],
      address: json['address'],
      driverLicenseNumber: json['driverLicenseNumber'],
      licenseImage: json['licenseImage'],
      experienceYear: json['experienceYear'],
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    List<int> profileImageBytes = await idImage.readAsBytesSync();
    List<int> driverLicenseImageBytes = await licenseImage.readAsBytesSync();

    return <String, dynamic>{
      'fullName': fullName,
      'age': age,
      'idImage': profileImageBytes,
      'address': address,
      'driverLicenseNumber': driverLicenseNumber,
      'licenseImage': driverLicenseImageBytes,
      'experienceYear': experienceYear,
    };
  }
}
