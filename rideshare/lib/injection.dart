import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/pick_location/data/datasources/destination_datasource.dart';
import 'package:rideshare/features/pick_location/data/repositories/destination_repository.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';
import 'package:rideshare/features/pick_location/domain/usecases/destination_usecase.dart';

import 'core/network/network_info.dart';

import 'features/pick_location/presentation/bloc/passenger_home_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjection() async {
  // bloc
  sl.registerFactory(() => NamesBloc(fetchPassengerHistoryUseCase: sl()));

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
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}
