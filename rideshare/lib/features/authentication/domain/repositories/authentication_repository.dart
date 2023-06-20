import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import '../../../../core/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginPayload>> login({required String phoneNumber});
}


