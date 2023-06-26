import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/login.dart';
import 'package:rideshare/features/authentication/domain/usecases/signup.dart';
import 'package:rideshare/features/authentication/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/datasources/auth_local_datasource.dart';
import '../../features/authentication/presentation/bloc/signup/bloc/signup_bloc.dart';
import 'injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> authInjectionInit() async {
  //Firebase
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  //! Bloc
  sl.registerFactory(() => SignUpBloc(signup: sl()));
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));
  //! usecases
  sl.registerLazySingleton(() => Signup(sl()));
  sl.registerLazySingleton(() => Login(repository: sl(), userRepository: sl()));
  //! Repositories
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          userDataSource: sl(), sharedPreferencesDataSource: sl()));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sharedPreferencesDataSource: sl()));
  //! Datasource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<SharedPreferencesDataSource>(
      () => SharedPreferencesDataSourceImpl(sharedPreferences: sl()));

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
