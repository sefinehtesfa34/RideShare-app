import 'package:http/http.dart' as http;
import 'package:rideshare/core/network/network_info.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/repositories/authentication_repository_impl.dart';

import 'package:rideshare/features/feeds/data/datasource/remote_location_data.dart';
import 'package:rideshare/features/feeds/data/repository/location_repository.dart';
import 'package:rideshare/features/feeds/domain/repository/location_repository.dart';
import 'package:rideshare/features/feeds/domain/usecase/location_usecase.dart';
import 'package:rideshare/features/feeds/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/presentation/bloc/location_bloc.dart';
import 'package:rideshare/features/pick_location/domain/usecases/destination_usecase.dart';
import 'package:rideshare/features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';

import '../../features/authentication/domain/repositories/authentication_repository.dart';
import '../../features/pick_location/data/datasources/destination_datasource.dart';
import '../../features/pick_location/data/repositories/destination_repository.dart';
import 'injection_container.dart';

void locationInjectionInit() {
  // Register the HTTP client

  // Register the UserDataSource implementationR

  // Register the OTPVerificationRepository implementation
  sl.registerLazySingleton<OTPVerificationRepository>(
    () => OTPVerificationRepositoryImpl(
        userDataSource: sl<AuthRemoteDataSource>()),
  );

  // Register the UserDataSource implementation
  sl.registerLazySingleton<RemoteLocationDataSource>(
    () => RemoteLocationDataSourceImpl(client: sl<http.Client>()),
  );

  // Register the OTPVerificationRepository implementation
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
        remoteLocationDataSource: sl<RemoteLocationDataSource>()),
  );

  sl.registerLazySingleton<DestinationRepository>(() =>
      DestinationRepositoryImpl(
          destinationDataSource: sl<DestinationDataSource>(),
          networkInfo: sl<NetworkInfo>()));

  sl.registerLazySingleton<DestinationDataSource>(
      () => DestinationDataSourceImp(client: sl<http.Client>()));
  // Register the OtpVerificationUseCase
  sl.registerLazySingleton<GetLocationUsecase>(
    () => GetLocationUsecase(locationRepository: sl<LocationRepository>()),
  );
  sl.registerLazySingleton<PostLocationUsecase>(
    () => PostLocationUsecase(locationRepository: sl<LocationRepository>()),
  );
  sl.registerLazySingleton<FetchPassengerHistoryUseCase>(
    () => FetchPassengerHistoryUseCase(sl<DestinationRepository>()),
  );
  // Register the OtpVerificationBloc
  sl.registerFactory<LocationBloc>(
    () => LocationBloc(
        getUsecase: sl<GetLocationUsecase>(),
        postLocationUsecase: sl<PostLocationUsecase>()),
  );
  sl.registerFactory<BackToLocationBloc>(
    () => BackToLocationBloc(),
  );
  sl.registerFactory<NamesBloc>(() => NamesBloc(
      fetchPassengerHistoryUseCase: sl<FetchPassengerHistoryUseCase>()));
  sl.registerFactory<ChooseLocationsBloc>(() => ChooseLocationsBloc());
  sl.registerFactory<CurrentLocationBloc>(() => CurrentLocationBloc());
}
