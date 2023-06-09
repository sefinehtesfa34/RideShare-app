import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class Signup implements UseCase<SignupPayload, SignupPayload> {
  final AuthenticationRepository authRepo;
  Signup(this.authRepo);

  @override
  Future<Either<Failure, SignupPayload>> call(SignupPayload payload) async {
    return await authRepo.signup(payload);
  }
}
