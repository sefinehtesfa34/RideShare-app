import 'dart:io';

import 'package:equatable/equatable.dart';

class SignupPayload extends Equatable {
  final String fullName;
  final int age;
  final File idImage;
  final String address;
  final int driverLicenseNumber;
  final File licenseImage;
  final int experienceYear;

  const SignupPayload({
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
