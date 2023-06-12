import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/verify_otp.dart';

import 'otp_verification_test.mocks.dart';

@GenerateMocks([OTPVerificationRepository])
void main() {
  late MockOTPVerificationRepository mockRepository;
  late OtpVerificationUseCase useCase;

  setUp(() {
    mockRepository = MockOTPVerificationRepository();
    useCase = OtpVerificationUseCase(otpVerificationRepository: mockRepository);
  });

  group('OtpVerificationUseCase', () {
    const Params params = Params(email: 'test@example.com', otp: '1234');
    const bool successResult = true;
    const ServerFailure failureResult = ServerFailure('Verification failed');

    test('should return success result when OTP verification is successful',
        () async {
      // Arrange
      when(mockRepository.verifyOTP(params.email, params.otp))
          // ignore: always_specify_types
          .thenAnswer((_) async => const Right(successResult));

      // Act
      final Either<Failure, bool> result = await useCase(params);

      // Assert
      // ignore: always_specify_types
      expect(result, const Right(successResult));
      verify(mockRepository.verifyOTP(params.email, params.otp));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure result when OTP verification fails', () async {
      // Arrange
      when(mockRepository.verifyOTP(params.email, params.otp))
      // ignore: always_specify_types
          .thenAnswer((_) async => const Left(failureResult));

      // Act
      final Either<Failure, bool> result = await useCase.call(params);

      // Assert
      // ignore: always_specify_types
      expect(result, const Left(failureResult));
      verify(mockRepository.verifyOTP(params.email, params.otp));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
