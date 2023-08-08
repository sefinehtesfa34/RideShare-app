import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import 'package:rideshare/features/authentication/data/models/user_profile_model.dart';
import 'package:rideshare/features/authentication/data/repositories/authentication_repository_impl.dart';

import 'authentication_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late AuthenticationRepositoryImpl repository;
  late MockAuthRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockAuthRemoteDataSource();
    repository = AuthenticationRepositoryImpl(userDataSource: mockDataSource);
  });

  group('signup', () {
    final signupPayload = SignupPayloadModel(
      fullName: 'John Doe',
      age: 30,
      idImage: File('path/to/id_image.jpg'),
      address: '123 Main St',
      driverLicenseNumber: 123456789,
      licenseImage: File('path/to/license_image.jpg'),
      experienceYear: 5,
    );
    final userProfile = UserProfileModel(
      fullName: 'John Doe',
      age: 30,
      idImage: 'path/to/id_image.jpg',
      address: '123 Main St',
      driverLicenseNumber: 123456789,
      licenseImage: 'path/to/license_image.jpg',
      experienceYear: 5,
    );

    test('should return UserProfile when signup is successful', () async {
      // Arrange
      when(mockDataSource.signup(signupPayload))
          .thenAnswer((_) async => userProfile);

      // Act
      final result = await repository.signup(signupPayload);

      // Assert
      expect(result, Right(userProfile));
      verify(mockDataSource.signup(signupPayload)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return ServerFailure when signup throws a ServerException',
        () async {
      // Arrange
      when(mockDataSource.signup(signupPayload))
          .thenThrow(ServerException("Server Exception"));

      // Act
      final result = await repository.signup(signupPayload);

      // Assert
      expect(result, Left(ServerFailure('Server Failure')));
      verify(mockDataSource.signup(signupPayload)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
