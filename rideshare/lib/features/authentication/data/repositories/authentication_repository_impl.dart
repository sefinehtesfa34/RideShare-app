import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthRemoteDataSource userDataSource;
  final SharedPreferencesDataSource sharedPreferencesDataSource;

  AuthenticationRepositoryImpl({
    required this.userDataSource,
    required this.sharedPreferencesDataSource,
  });

  @override
  Future<Either<Failure, SignupPayload>> signup(
      SignupPayload newUserCredentials) async {
    try {
      final SignupPayloadModel response =
          await userDataSource.signup(newUserCredentials);
      return Right<Failure, SignupPayload>(response);
    } on ServerException {
      return const Left<Failure, SignupPayload>(
          ServerFailure("Server Failure"));
    }
  }

  @override
  Future<Either<Failure, String>> login(String phoneNumber) async {
    try {
      final String response = await userDataSource.login(phoneNumber);
      return Right<Failure, String>(response);
    } on ServerException {
      return const Left<Failure, String>(ServerFailure('Server Failure'));
    }
  }
}

class OTPVerificationRepositoryImpl implements OTPVerificationRepository {
  final AuthRemoteDataSource userDataSource;
  OTPVerificationRepositoryImpl({required this.userDataSource});
  @override
  Future<Either<Failure, VerifyOtpModel>> verifyOTP(String phoneNumber) async {
    try {
      final VerifyOtpModel response =
          await userDataSource.verifyOtp(phoneNumber);
      // ignore: always_specify_types
      return Right(response);
    } on ServerException {
      // ignore: always_specify_types
      return const Left(ServerFailure('Server Failure'));
    }
  }
}

class UserRepositoryImpl implements UserRepository {
  final SharedPreferencesDataSource sharedPreferencesDataSource;

  UserRepositoryImpl({required this.sharedPreferencesDataSource});

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final bool isLoggedIn = await sharedPreferencesDataSource.isLoggedIn();
      return Right<Failure, bool>(isLoggedIn);
    } on CacheException {
      return const Left<Failure, bool>(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setLoggedIn(String phoneNumber) async {
    try {
      await sharedPreferencesDataSource.setLoggedIn(true);
      return const Right<Failure, void>(null);
    } catch (e) {
      return const Left<Failure, void>(CacheFailure());
    }
  }
}
