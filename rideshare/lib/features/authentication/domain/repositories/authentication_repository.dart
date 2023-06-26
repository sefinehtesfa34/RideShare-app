import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import '../../../../core/errors/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, String>> login(String phoneNumber);

  Future<Either<Failure, SignupPayload>> signup(
      SignupPayload newUserCredentials);
}

abstract class OTPVerificationRepository {
  Future<Either<Failure, VerifyOtpModel>> verifyOTP(String phoneNumber);
}

abstract class UserRepository {
  Future<Either<Failure, bool>> isLoggedIn();
  Future<Either<Failure, void>> setLoggedIn(String phoneNumber);
}
