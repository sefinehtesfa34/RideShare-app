import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';

import 'authentication_repository_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, OTPVerificationRepository])
void main() {
  group('AuthenticationRepository', () {
    late AuthenticationRepository repository;

    setUp(() {
      // Initialize the repository before each test case
      repository = MockAuthenticationRepository();
    });

    test('login should return a LoginPayload on success', () async {
      // Arrange
      final userCredentials = LoginPayload(
        phoneNumber: '1234567890', // Add phoneNumber argument
      );

      // Add this line to stub the login method
      when(repository.login(userCredentials)).thenAnswer(
          (_) async => Right<Failure, LoginPayload>(userCredentials));

      // Act
      final result = await repository.login(userCredentials);

      // Assert
      expect(result, isA<Right<Failure, LoginPayload>>());
    });

    test('login should return a Failure on failure', () async {
      // Arrange
      final userCredentials = LoginPayload(
        phoneNumber: '1234567890', // Add phoneNumber argument
      );

      // Add this line to stub the login method
      when(repository.login(userCredentials)).thenAnswer(
          (_) async => Left<Failure, LoginPayload>(ServerFailure()));

      // Act
      final result = await repository.login(userCredentials);

      // Assert
      expect(result, isA<Left<Failure, LoginPayload>>());
    });
  });
}
