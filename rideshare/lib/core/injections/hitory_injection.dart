import '../../features/pick_location/data/datasources/destination_datasource.dart';
import '../../features/pick_location/data/repositories/destination_repository.dart';
import '../../features/pick_location/domain/repositories/destination_repository.dart';
import '../../features/pick_location/domain/usecases/destination_usecase.dart';
import '../../features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import 'injection_container.dart';

Future<void> setupInjection() async {
  // bloc
  // sl.registerFactory(() => NamesBloc(fetchPassengerHistoryUseCase: sl()));

  // // usecase
  // sl.registerFactory(() => FetchPassengerHistoryUseCase(sl()));

  // // repo
  // sl.registerLazySingleton<DestinationRepository>(() =>
  //     DestinationRepositoryImpl(
  //         destinationDataSource: sl(), networkInfo: sl()));

  // // data source
  // sl.registerLazySingleton<DestinationDataSource>(
  //     () => DestinationDataSourceImp(client: sl()));
}
