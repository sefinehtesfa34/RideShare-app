part of 'sign_up_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  final String fullName;
  final int age;
  final File idImage;
  final String address;
  final int driverLicenseNumber;
  final File licenseImage;
  final int experienceYear;

  const AuthenticationEvent({
    required this.address,
    required this.driverLicenseNumber,
    required this.licenseImage,
    required this.experienceYear,
    required this.fullName,
    required this.age,
    required this.idImage,
  });
}

class SignUpEvent extends AuthenticationEvent {
  const SignUpEvent({
    required super.fullName,
    required super.age,
    required super.idImage,
    required super.address,
    required super.driverLicenseNumber,
    required super.licenseImage,
    required super.experienceYear,
  });
}
