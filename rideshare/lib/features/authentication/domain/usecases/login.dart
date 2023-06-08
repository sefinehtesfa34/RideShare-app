import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class Login implements UseCase<LoginPayload, LoginPayload> {
  final AuthenticationRepository authRepo;
  Login(this.authRepo);

  @override
  Future<Either<Failure, LoginPayload>> call(LoginPayload payload) async {
    return await authRepo.login(payload);
  }
}
