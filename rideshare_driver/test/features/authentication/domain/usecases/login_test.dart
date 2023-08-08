import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/login.dart';

import '../repositories/authentication_repository_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  late AuthenticationRepository mockAuthenticationRepository;
  Login usecase = Login(MockAuthenticationRepository());

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    usecase = Login(mockAuthenticationRepository);
  });

  final tPayload = LoginPayload(phoneNumber: '1234567890');
  final tLoginPayload = LoginPayload(phoneNumber: '1234567890');

  test(
    'should call the login method in the AuthenticationRepository with the provided payload',
    () async {
      // Arrange
      when(mockAuthenticationRepository.login(tLoginPayload))
          .thenAnswer((_) async => Right(tLoginPayload));
      // Act
      final result = await usecase(tPayload);
      // Assert
      expect(result, Right(tLoginPayload));
      verify(mockAuthenticationRepository.login(tPayload));
      verifyNoMoreInteractions(mockAuthenticationRepository);
    },
  );
}