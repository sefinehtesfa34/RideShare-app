import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/passenger/data/datasource/ride_remote_data_source.dart';
import '../../features/passenger/data/datasource/ride_request_api_provider.dart';
import '../../features/passenger/data/repository/ride_repository.dart';
import '../../features/passenger/domain/repository/ride_repository.dart';
import '../../features/passenger/domain/usecases/cancel_ride_usecase.dart';
import '../../features/passenger/domain/usecases/ride_request_usecase.dart';
import '../../features/passenger/presentation/bloc/cancel_ride_bloc/cancel_ride_bloc.dart';
import '../../features/passenger/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';
import 'injection_container.dart';

Future<void> RideRequestInjectionInit() async {
  //! Bloc
  sl.registerFactory(() => RideRequestBloc(sl()));
  sl.registerFactory(() => CancelRideBloc(sl()));

  //! Usecase
  sl.registerLazySingleton(() => GetRideRequestUseCase(repository: sl()));
  sl.registerLazySingleton(() => CancelRideRequest(sl()));

  //! Repositories
  sl.registerLazySingleton<RideRepository>(
      () => RideRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  //! Datasource
  sl.registerLazySingleton<RideRemoteDataSource>(
      () => RideRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton(() => RideRequestApiProvider(
      baseUrl: "https://rideshare-app.onrender.com/api"));

}
