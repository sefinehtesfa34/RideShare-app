import 'dart:io';

import '../../domain/entities/user_profile.dart';
class UserProfileModel extends UserProfile {
  final String fullName;
  final int age;
  final String idImage;
  final String address;
  final int driverLicenseNumber;
  final String licenseImage;
  final int experienceYear;

  const UserProfileModel({
    required this.fullName,
    required this.age,
    required this.idImage,
    required this.address,
    required this.driverLicenseNumber,
    required this.licenseImage,
    required this.experienceYear,
  }) : super(
            fullName: fullName,
            age: age,
            idImage: idImage,
            address: address,
            driverLicenseNumber: driverLicenseNumber,
            licenseImage: licenseImage,
            experienceYear: experienceYear);
  @override
  List<Object> get props => <Object>[
        fullName,
        age,
        idImage,
        address,
        driverLicenseNumber,
        licenseImage,
        experienceYear
      ];
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      fullName: json['fullName'],
      age: json['age'],
      idImage: json['idImage'],
      address: json['address'],
      driverLicenseNumber: json['driverLicenseNumber'],
      licenseImage: json['licenseImage'],
      experienceYear: json['experienceYear'],
    );
  }
}
