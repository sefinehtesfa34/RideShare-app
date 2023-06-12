// domain/otp_verification_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';

import '../repositories/authentication_repository.dart';

class OtpVerificationUseCase extends UseCase<bool, Params> {
  final OTPVerificationRepository otpVerificationRepository;

  OtpVerificationUseCase({required this.otpVerificationRepository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await otpVerificationRepository.verifyOTP(params.email, params.otp);
  }
}

class Params {
  final String email;
  final String otp;
  const Params({required this.email, required this.otp});
}
