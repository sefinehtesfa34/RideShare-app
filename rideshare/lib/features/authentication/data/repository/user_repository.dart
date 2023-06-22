import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/exception.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/data/datasources/user_datasource.dart';
import '../../domain/repositories/authentication_repository.dart';

class OTPVerificationRepositoryImpl implements OTPVerificationRepository {
  final UserDataSource userDataSource;

  OTPVerificationRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<Failure, String>> verifyOTP(String phoneNumber, String otp) async {
    try {
      final String response = await userDataSource.verifyOtp(phoneNumber, otp);
      // ignore: always_specify_types
      return Right(response);
    } on ServerException {
      // ignore: always_specify_types
      return const Left(ServerFailure('Server Failure'));
    }
  }
}

