import 'package:dartz/dartz.dart';
import 'package:rideshare_driver/features/authentication/domain/entities/user_profile.dart';
import '../../../../core/errors/failures.dart';
import '../entities/login_payload.dart';
import '../entities/signup_payload.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginPayload>> login(LoginPayload userCredentials);

  Future<Either<Failure, UserProfile>> signup(SignupPayload newUserCredentials);
}

abstract class OTPVerificationRepository {
  Future<Either<Failure, bool>> verifyOTP(String phoneNumber, String otp);
}
