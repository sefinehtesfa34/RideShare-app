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
import 'signup_test.mocks.dart';

@GenerateMocks(<Type>[File])
void main() {
  late Signup signup;
  late MockAuthenticationRepository mockRepository;

  final MockFile mockFile = MockFile();
  final SignupPayload user = SignupPayload(
    fullName: "testName",
    age: 22,
    idImage: mockFile,
  );
  setUp(() {
    mockRepository = MockAuthenticationRepository();
    signup = Signup(mockRepository);
  });
  test("Should create a new user", () async {
    when(mockRepository.signup(user)).thenAnswer((_) async => Right(user));

    final Either<Failure, SignupPayload> result = await signup(user);
    expect(result, Right(user));
    verify(mockRepository.signup(user));
    verifyNoMoreInteractions(mockRepository);
  });

  test("Should return server failure when user cannot signup", () async {
    when(mockRepository.signup(user)).thenAnswer(
        (_) async => const Left(ServerFailure("Internal Server Failure")));

    final Either<Failure, SignupPayload> result = await signup(user);
    expect(result, const Left(ServerFailure("Internal Server Failure")));
    verify(mockRepository.signup(user));
    verifyNoMoreInteractions(mockRepository);
  });
  test("Should return InputFailure when invalid credentials are provided",
      () async {
    SignupPayload user = SignupPayload(
      fullName: "invalid",
      age: 17,
      idImage: mockFile,
    );

    when(mockRepository.signup(user))
        .thenAnswer((_) async => const Left(InputFailure("Invalid Data")));

    final Either<Failure, SignupPayload> result = await signup(user);
    expect(result, const Left(InputFailure("Invalid Data")));
    verify(mockRepository.signup(user));
    verifyNoMoreInteractions(mockRepository);
  });
}
