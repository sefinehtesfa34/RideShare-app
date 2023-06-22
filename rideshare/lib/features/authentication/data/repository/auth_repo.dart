import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/login_payload.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, LoginPayload>> login(
      {required String phoneNumber}) async {
    
      try {
        return Right(
          await remoteDataSource.login(phoneNumber));
      } on ServerException {
        return Left(ServerFailure());
      }

 
  }

  // @override
  // Future<Either<Failure, SignupPayload>> signup(SignupPayload newuser) async {
  //   try {
  //     final response = await remoteDataSource.signup(newuser.age,
  //         newuser.fullName, newuser.id, newuser.sex, newuser.phoneNumber);
  //     return Right(response);
  //   } on ServerException {
  //     return Left(ServerFailure("Internal Server Error."));
  //   }
  // }
}
