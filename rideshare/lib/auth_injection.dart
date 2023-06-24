import 'package:get_it/get_it.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/login.dart';
import 'package:rideshare/features/authentication/domain/usecases/signup.dart';
import 'package:rideshare/features/authentication/presentation/bloc/login/bloc/login_bloc.dart';

import 'features/authentication/presentation/bloc/signup/bloc/signup_bloc.dart';

final sl = GetIt.instance;

Future<void> authInjectionInit() async {
  //! Bloc
  sl.registerFactory(() => SignUpBloc(signup: sl()));
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));
  //! usecases
  sl.registerLazySingleton(() => Signup(sl()));
  sl.registerLazySingleton(() => Login(repository: sl()));
  //! Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(userDataSource: sl()));

  //! Datasource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));
}
