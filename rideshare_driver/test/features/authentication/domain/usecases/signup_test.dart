import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/signup.dart';
import 'package:rideshare/features/authentication/domain/entities/user_profile.dart';
import 'signup_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, Failure])
void main() {
  late Signup signup;
  late AuthenticationRepository mockAuthRepo;
  late Failure myFailure;

  setUp(() {
    mockAuthRepo = MockAuthenticationRepository();
    signup = Signup(mockAuthRepo);
    myFailure = MockFailure(); // Create an instance of Failure
  });

  test('should return a UserProfile when signup is successful', () async {
    // Arrange
    final payload = SignupPayload(
      fullName: 'John Doe',
      age: 30,
      idImage: File('path/to/id_image.jpg'),
      address: '123 Main St',
      driverLicenseNumber: 123456789,
      licenseImage: File('path/to/license_image.jpg'),
      experienceYear: 5,
    );
    final userProfile = UserProfile(
      fullName: 'John Doe',
      age: 30,
      idImage: 'path/to/id_image.jpg',
      address: '123 Main St',
      driverLicenseNumber: 123456789,
      licenseImage: 'path/to/license_image.jpg',
      experienceYear: 5,
    );
    when(mockAuthRepo.signup(payload))
        .thenAnswer((_) async => Right(userProfile));
    // Act
    final result = await signup(payload);

    // Assert
    expect(result, Right(userProfile));
    verify(mockAuthRepo.signup(payload)).called(1);
    verifyNoMoreInteractions(mockAuthRepo);
  });

  test('should return a Failure when signup fails', () async {
    // Arrange
    final payload = SignupPayload(
      fullName: 'John Doe',
      age: 30,
      idImage: File('path/to/id_image.jpg'),
      address: '123 Main St',
      driverLicenseNumber: 123456789,
      licenseImage: File('path/to/license_image.jpg'),
      experienceYear: 5,
    );
    final failure = myFailure; // Use the instance of Failure
    when(mockAuthRepo.signup(payload)).thenAnswer((_) async => Left(failure));
    // Act
    final result = await signup.call(payload);

    // Assert
    expect(result, Left(failure));
    verify(mockAuthRepo.signup(payload)).called(1);
    verifyNoMoreInteractions(mockAuthRepo);
  });
}