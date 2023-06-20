import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/data/datasources/user_datasource.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/authentication_repository.dart';

class OTPVerificationRepositoryImpl implements OTPVerificationRepository {
  final UserDataSource userDataSource;
  OTPVerificationRepositoryImpl({required this.userDataSource});
  @override
  Future<Either<Failure, bool>> verifyOTP(String phoneNumber, String otp) async {
    try {
      final bool response = await userDataSource.verifyOtp(phoneNumber, otp);
      return Right(response);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    }
  }
}
