import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/exception.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/datasources/user_datasource.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthRemoteDataSource userDataSource;

  AuthenticationRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<Failure, SignupPayload>> signup(
      SignupPayload newUserCredentials) async {
    try {
      final SignupPayloadModel response =
          await userDataSource.signup(newUserCredentials);
      return Right(response);
    } on ServerException {
      return const Left(ServerFailure("Server Failure"));
    }
  }

  @override
  Future<Either<Failure, LoginPayload>> login(LoginPayload userCredentials) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

class OTPVerificationRepositoryImpl implements OTPVerificationRepository {
  final UserDataSource userDataSource;
  OTPVerificationRepositoryImpl({required this.userDataSource});
  @override
  Future<Either<Failure, String>> verifyOTP(
      String phoneNumber, String otp) async {
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
