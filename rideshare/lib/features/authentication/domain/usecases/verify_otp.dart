// domain/otp_verification_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';

import '../repositories/authentication_repository.dart';

class OtpVerificationUseCase extends UseCase<VerifyOtpModel, String> {
  final OTPVerificationRepository otpVerificationRepository;

  OtpVerificationUseCase({required this.otpVerificationRepository});

  @override
  Future<Either<Failure, VerifyOtpModel>> call(String params) async {
    return await otpVerificationRepository.verifyOTP(params);
  }
}

