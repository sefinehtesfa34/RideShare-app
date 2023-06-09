import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/signup.dart';

import 'login_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  late Signup signup;
  late MockAuthenticationRepository mockRepository;

  const user = SignupPayload(
    fullName: "testName",
    phoneNumber: "+251923423433",
    sex: "M",
    age: 22,
  );
  setUp(() {
    mockRepository = MockAuthenticationRepository();
    signup = Signup(mockRepository);
  });
  test("Should create a new user", () async {
    when(mockRepository.signup(user))
        .thenAnswer((_) async => const Right(user));

    final result = await signup(user);
    expect(result, const Right(user));
    verify(mockRepository.signup(user));
    verifyNoMoreInteractions(mockRepository);
  });

  test("Should return server failure when user cannot signup", () async {
    when(mockRepository.signup(user)).thenAnswer(
        (_) async => Left(ServerFailure("Internal Server Failure")));

    final result = await signup(user);
    expect(result, Left(ServerFailure("Internal Server Failure")));
    verify(mockRepository.signup(user));
    verifyNoMoreInteractions(mockRepository);
  });
  test("Should return InputFailure when invalid credentials are provided",
      () async {
    const user = SignupPayload(
      fullName: "invalid",
      phoneNumber: "invalid",
      sex: "F",
      age: 17,
    );

    when(mockRepository.signup(user))
        .thenAnswer((_) async => Left(InputFailure("Invalid Data")));

    final result = await signup(user);
    expect(result, Left(InputFailure("Invalid Data")));
    verify(mockRepository.signup(user));
    verifyNoMoreInteractions(mockRepository);
  });
}
