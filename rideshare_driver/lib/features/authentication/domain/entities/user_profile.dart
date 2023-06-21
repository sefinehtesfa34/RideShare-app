import 'dart:io';

import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String fullName;
  final int age;
  final String idImage;
  final String address;
  final int driverLicenseNumber;
  final String licenseImage;
  final int experienceYear;

  const UserProfile({
    required this.fullName,
    required this.age,
    required this.idImage,
    required this.address,
    required this.driverLicenseNumber,
    required this.licenseImage,
    required this.experienceYear,
  });
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
}
