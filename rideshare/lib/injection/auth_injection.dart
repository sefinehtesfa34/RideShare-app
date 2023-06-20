import 'package:get_it/get_it.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/repository/auth_repo.dart';
import 'package:rideshare/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rideshare/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/network/network_info.dart';
import '../features/authentication/domain/usecases/login.dart';

final sl = GetIt.instance;
void authInit()  {
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
        
        loginUsecase: sl()),
  );

  // usecases
  sl.registerLazySingleton(
    () => Login(repository: sl()),
  );



  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(

    () => AuthenticationRepositoryImpl(
      
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(client: sl()),
  );


  //core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker:sl()),
  );

  //external
  
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}