import 'package:get_it/get_it.dart';
import 'package:rideshare_driver/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare_driver/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:rideshare_driver/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare_driver/features/authentication/domain/usecases/signup.dart';
import 'package:rideshare_driver/features/authentication/presentation/bloc/signup/sign_up_bloc.dart';

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
