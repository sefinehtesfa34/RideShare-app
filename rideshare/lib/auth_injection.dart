import 'package:get_it/get_it.dart';

import 'features/authentication copy/data/datasources/auth_remote_datasource.dart';
import 'features/authentication copy/data/repositories/authentication_repository_impl.dart';
import 'features/authentication copy/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/signup.dart';
import 'features/authentication/presentation/bloc/signup/bloc/signup_bloc.dart';

final sl = GetIt.instance;

Future<void> authInjectionInit() async {
  //! Bloc
  sl.registerFactory(() => SignUpBloc(signup: sl()));

  //! usecases
  sl.registerLazySingleton(() => Signup(sl()));

  //! Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(userDataSource: sl()));

  //! Datasource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));
}
