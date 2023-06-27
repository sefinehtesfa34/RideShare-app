import '../../features/pick_passengers/data/datasource/ride_offer_datasource.dart';
import '../../features/pick_passengers/data/repositories/ride_offer_repository.dart';
import '../../features/pick_passengers/domain/repository/ride_offer.dart';
import '../../features/pick_passengers/domain/usecase/add_passenger_usecase.dart';
import '../../features/pick_passengers/domain/usecase/get_ride_offers_usecase.dart';
import '../../features/pick_passengers/presentation/bloc/fetch_passengers/fetch_passengers_bloc.dart';
import '../../features/pick_passengers/presentation/bloc/pick_passengers/pick_passengers_bloc.dart';
import '../../features/pick_passengers/presentation/bloc/sorting_selector/sorting_selector_bloc.dart';
import 'injection_container.dart';

PickPassengersInit() {
  sl.registerFactory(() => FetchPassengersBloc(sl()));
  sl.registerFactory(() => SortingSelectorBloc());
    sl.registerFactory(() => PickPassengersBloc(sl()));


  sl.registerLazySingleton(() => GetRideOffersUseCase(sl()));
  sl.registerLazySingleton(() => AddPassengerUseCase(sl()));

  sl.registerLazySingleton<RideOfferRepository>(
      () => RideOfferRepositoryImpl(sl()));

  sl.registerLazySingleton<RideOfferApi>(
      () => RideOfferApiImpl(baseUrl: "http://baseurl"));
}
