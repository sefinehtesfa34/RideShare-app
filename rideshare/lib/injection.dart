import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/feed/presentation/bloc/passenger_home_bloc.dart';

import 'core/network/network_info.dart';
import 'features/feed/data/datasources/destination_datasource.dart';
import 'features/feed/data/repositories/destination_repository.dart';
import 'features/feed/domain/repositories/destination_repository.dart';
import 'features/feed/domain/usecases/destination_usecase.dart';

final sl = GetIt.instance;

Future<void> setupInjection() async {
  // bloc
  sl.registerFactory(() => NamesBloc(
      fetchPassengerHistoryUseCase: sl<FetchPassengerHistoryUseCase>()));

  // usecase
  sl.registerFactory(() => FetchPassengerHistoryUseCase(sl()));

  // repo
  sl.registerLazySingleton<DestinationRepository>(() =>
      DestinationRepositoryImpl(
          destinationDataSource: sl(), networkInfo: sl()));

  // data source
  sl.registerLazySingleton<DestinationDataSource>(
      () => DestinationDataSourceImp(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
