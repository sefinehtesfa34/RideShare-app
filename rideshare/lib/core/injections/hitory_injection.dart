import 'package:rideshare/features/feed/presentation/bloc/passenger_home_bloc.dart';

import '../../features/feed/data/datasources/destination_datasource.dart';
import '../../features/feed/data/repositories/destination_repository.dart';
import '../../features/feed/domain/repositories/destination_repository.dart';
import '../../features/feed/domain/usecases/destination_usecase.dart';
import 'injection_container.dart';

Future<void> setupInjection() async {
  // bloc
  sl.registerFactory(() => NamesBloc(
      fetchPassengerHistoryUseCase: sl()));

  // usecase
  sl.registerFactory(() => FetchPassengerHistoryUseCase(sl()));

  // repo
  sl.registerLazySingleton<DestinationRepository>(() =>
      DestinationRepositoryImpl(
          destinationDataSource: sl(), networkInfo: sl()));

  // data source
  sl.registerLazySingleton<DestinationDataSource>(
      () => DestinationDataSourceImp(client: sl()));
}
