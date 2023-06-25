import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class FirebaseOtpRepository {
  Future<Either<Failure, String>> sendOTP(String phoneNumber);
  Future<Either<Failure, void>> verifyOTP(String verificationId, String otp);
}