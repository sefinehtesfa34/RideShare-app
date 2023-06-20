import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'features/passenger/data/datasource/ride_remote_data_source.dart';
import 'features/passenger/data/datasource/ride_request_api_provider.dart';
import 'features/passenger/data/repository/ride_repository.dart';
import 'features/passenger/domain/repository/ride_repository.dart';
import 'features/passenger/domain/usecases/ride_request_usecase.dart';
import 'features/passenger/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';

final sl = GetIt.instance;

Future<void> RideRequestInjectionInit() async {
  //! Bloc
  sl.registerFactory(() => RideRequestBloc(sl()));

  //! Usecase
  sl.registerLazySingleton(() => GetRideRequestUseCase(repository: sl()));

  //! Repositories
  sl.registerLazySingleton<RideRepository>(
      () => RideRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  //! Datasource
  sl.registerLazySingleton<RideRemoteDataSource>(
      () => RideRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton(
      () => RideRequestApiProvider(baseUrl: "http://the base url goes here"));

  //! External
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
