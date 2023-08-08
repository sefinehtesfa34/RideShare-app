// domain/otp_verification_use_case_test.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/verify_otp.dart';

import '../repositories/authentication_repository_test.mocks.dart';

@GenerateMocks([OTPVerificationRepository])

void main() {
  late OtpVerificationUseCase useCase;
  late MockOTPVerificationRepository mockRepository;

  setUp(() {
    mockRepository = MockOTPVerificationRepository();
    useCase = OtpVerificationUseCase(otpVerificationRepository: mockRepository);
  });

  test('should verify OTP and return true', () async {
    // Arrange
    final phoneNumber = '1234567890';
    final otp = '123456';
    final params = Params(phoneNumber: phoneNumber, otp: otp);
    when(mockRepository.verifyOTP(phoneNumber, otp))
        .thenAnswer((_) async => Right(true));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result, Right(true));
    verify(mockRepository.verifyOTP(phoneNumber, otp));
    verifyNoMoreInteractions(mockRepository);
  });
}