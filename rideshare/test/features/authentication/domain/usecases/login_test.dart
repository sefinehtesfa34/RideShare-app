import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/login.dart';

import 'login_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  late Login login;
  late MockAuthenticationRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthenticationRepository();
    login = Login(mockRepository);
  });
  test("Should authenticate the user", () async {
    const user = LoginPayload(phoneNumber: "+251923423423");

    when(mockRepository.login(user)).thenAnswer((_) async => const Right(user));

    final result = await login(user);
    expect(result, const Right(user));
    verify(mockRepository.login(user));
    verifyNoMoreInteractions(mockRepository);
  });

  test("Should return server failure when user cannot login", () async {
    const user = LoginPayload(phoneNumber: "+251923423423");

    when(mockRepository.login(user)).thenAnswer(
        (_) async => Left(ServerFailure("Internal Server Failure")));

    final result = await login(user);
    expect(result, Left(ServerFailure("Internal Server Failure")));
    verify(mockRepository.login(user));
    verifyNoMoreInteractions(mockRepository);
  });
  test("Should return InputFailure when invalid credentials are provided",
      () async {
    const user = LoginPayload(phoneNumber: "invalid data");

    when(mockRepository.login(user))
        .thenAnswer((_) async => Left(InputFailure("Invalid Data")));

    final result = await login(user);
    expect(result, Left(InputFailure("Invalid Data")));
    verify(mockRepository.login(user));
    verifyNoMoreInteractions(mockRepository);
  });
}
