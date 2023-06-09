import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import '../../../../core/errors/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginPayload>> login(LoginPayload userCredentials);

  Future<Either<Failure, SignupPayload>> signup(
      SignupPayload newUserCredentials);
}
