import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rideshare/core/network/network_info.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/repositories/authentication_repository_impl.dart';

import 'package:rideshare/features/feeds/location/data/datasource/remote_location_data.dart';
import 'package:rideshare/features/feeds/location/data/repository/location_repository.dart';
import 'package:rideshare/features/feeds/location/domain/repository/location_repository.dart';
import 'package:rideshare/features/feeds/location/domain/usecase/location_usecase.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:rideshare/features/pick_location/domain/usecases/destination_usecase.dart';
import 'package:rideshare/features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import 'package:rideshare/features/pick_location/domain/repositories/destination_repository.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/verify_otp.dart';
import 'features/authentication/presentation/bloc/otp_bloc.dart';
import 'features/pick_location/data/datasources/destination_datasource.dart';
import 'features/pick_location/data/repositories/destination_repository.dart';

import '../../features/authentication/domain/repositories/authentication_repository.dart';
import '../../features/authentication/domain/usecases/verify_otp.dart';
import '../../features/authentication/presentation/bloc/otp/otp_bloc.dart';
import 'injection_container.dart';

void locationInjectionInit() {
  // Register the HTTP client

  // Register the UserDataSource implementationR

  // Register the OTPVerificationRepository implementation
  sl.registerLazySingleton<OTPVerificationRepository>(
    () => OTPVerificationRepositoryImpl(
        userDataSource: sl<AuthRemoteDataSource>()),
  );

  // Register the OtpVerificationUseCase
  sl.registerLazySingleton<OtpVerificationUseCase>(
    () => OtpVerificationUseCase(
        otpVerificationRepository: sl<OTPVerificationRepository>()),
  );
  // Register the OtpVerificationBloc
  sl.registerFactory<OtpVerificationBloc>(
    () => OtpVerificationBloc(useCase: sl<OtpVerificationUseCase>()),
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

  getIt.registerLazySingleton<DestinationRepository>(() =>
      DestinationRepositoryImpl(
          destinationDataSource: getIt<DestinationDataSource>(),
          networkInfo: getIt<NetworkInfo>()));

  getIt.registerLazySingleton<DestinationDataSource>(
      () => DestinationDataSourceImp(client: getIt<http.Client>()));
  // Register the OtpVerificationUseCase
  sl.registerLazySingleton<GetLocationUsecase>(
    () => GetLocationUsecase(locationRepository: sl<LocationRepository>()),
  );
  sl.registerLazySingleton<PostLocationUsecase>(
    () => PostLocationUsecase(locationRepository: sl<LocationRepository>()),
  );
  getIt.registerLazySingleton<FetchPassengerHistoryUseCase>(
    () => FetchPassengerHistoryUseCase(getIt<DestinationRepository>()),
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
  getIt.registerFactory<NamesBloc>(() => NamesBloc(
      fetchPassengerHistoryUseCase: getIt<FetchPassengerHistoryUseCase>()));
  getIt.registerFactory<ChooseLocationsBloc>(() => ChooseLocationsBloc());
  getIt.registerFactory<CurrentLocationBloc>(() => CurrentLocationBloc());
}
