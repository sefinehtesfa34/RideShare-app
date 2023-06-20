import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class Login implements UseCase<LoginPayload, LoginPayloadParams> {
  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, LoginPayload>> call(LoginPayloadParams params) async {
    return await repository.login(phoneNumber: params.phoneNumber);
  }

  Login({required this.repository});
}

class LoginPayloadParams {
  String phoneNumber;
  LoginPayloadParams({required this.phoneNumber});
}
