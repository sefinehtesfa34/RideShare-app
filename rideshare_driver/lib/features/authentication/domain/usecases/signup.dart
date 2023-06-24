import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/signup_payload.dart';
import '../repositories/authentication_repository.dart';
import '../entities/user_profile.dart';

class Signup implements UseCase<UserProfile, SignupPayload> {
  final AuthenticationRepository authRepo;
  Signup(this.authRepo);

  @override
  Future<Either<Failure, UserProfile>> call(SignupPayload payload) async {
    return await authRepo.signup(payload);
  }
}
