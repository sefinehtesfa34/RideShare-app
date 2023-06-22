// domain/otp_verification_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';

import '../repositories/authentication_repository.dart';

class OtpVerificationUseCase extends UseCase<String, Params> {
  final OTPVerificationRepository otpVerificationRepository;

  OtpVerificationUseCase({required this.otpVerificationRepository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await otpVerificationRepository.verifyOTP(params.phoneNumber, params.otp);
  }
}

class Params {
  final String phoneNumber;
  final String otp;
  const Params({required this.phoneNumber, required this.otp});
}
