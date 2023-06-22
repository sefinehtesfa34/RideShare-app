import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class OTPVerificationRepositoryImpl implements OTPVerificationRepository {
  final AuthRemoteDataSource userDataSource;
  OTPVerificationRepositoryImpl({required this.userDataSource});
  @override
  Future<Either<Failure, VerifyOtpModel>> verifyOTP(String phoneNumber) async {
    try {
      final VerifyOtpModel response = await userDataSource.verifyOtp(phoneNumber);
      return Right(response);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    }
  }
}
