import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/data/datasources/firebase_datasource.dart';
import '../../../../core/errors/failures.dart';

abstract class FirebaseOtpRepository {
  Future<Either<Failure, SendParams>> sendOTP(String phoneNumber);
  Future<Either<Failure, void>> verifyOTP(String verificationId, String otp);
}