import 'package:dartz/dartz.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class Login implements UseCase<String, String> {
  final AuthenticationRepository repository;
  final UserRepository userRepository;

  @override
  Future<Either<Failure, String>> call(String params) async {
    return await repository.login(params);
  }

  Login({
    required this.repository,
    required this.userRepository,
  });
}
