import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';

import '../repositories/firebase_repository.dart';

class SendOtpUsecase extends UseCase<String, String> {
  final FirebaseOtpRepository firebaseOtpRepository;
  SendOtpUsecase({
    required this.firebaseOtpRepository,
  });

  @override
  Future<Either<Failure, String>> call(String params) async {
    return await firebaseOtpRepository.sendOTP(params);
  }
}

class VerifyOtpUsecase extends UseCase<void, Params> {
  final FirebaseOtpRepository firebaseOtpRepository;
  VerifyOtpUsecase({required this.firebaseOtpRepository});
  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await firebaseOtpRepository.verifyOTP(
      params.verificationId,
      params.otp,
    );
  }
}

class Params {
  final String verificationId;
  final String otp;
  const Params({required this.otp, required this.verificationId});
}