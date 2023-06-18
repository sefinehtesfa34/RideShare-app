import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_payload.dart';
import '../repositories/authentication_repository.dart';

class Login implements UseCase<LoginPayload, LoginPayload> {
  final AuthenticationRepository authRepo;
  Login(this.authRepo);

  @override
  Future<Either<Failure, LoginPayload>> call(LoginPayload payload) async {
    return await authRepo.login(payload);
  }
}
