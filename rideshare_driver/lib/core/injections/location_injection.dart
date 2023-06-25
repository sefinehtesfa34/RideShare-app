import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/authentication/data/datasources/auth_remote_datasource.dart';
import '../../features/authentication/data/repositories/authentication_repository_impl.dart';
import '../../features/authentication/domain/repositories/authentication_repository.dart';
import '../../features/authentication/domain/usecases/verify_otp.dart';
import '../../features/pick_location/data/datasources/destination_datasource.dart';
import '../../features/pick_location/data/repositories/destination_repository.dart';
import '../../features/pick_location/domain/repositories/destination_repository.dart';
import '../../features/pick_location/domain/usecases/destination_usecase.dart';
import '../../features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import '../network/network_info.dart';
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

  // Register the UserDataSource implementation

  // Register the OTPVerificationRepository implementation

  sl.registerLazySingleton<DestinationRepository>(() =>
      DestinationRepositoryImpl(
          destinationDataSource: sl<DestinationDataSource>(),
          networkInfo: sl<NetworkInfo>()));

  sl.registerLazySingleton<DestinationDataSource>(
      () => DestinationDataSourceImp(client: sl<http.Client>()));
  // Register the OtpVerificationUseCase

  sl.registerLazySingleton<FetchPassengerHistoryUseCase>(
    () => FetchPassengerHistoryUseCase(sl<DestinationRepository>()),
  );
  // Register the OtpVerificationBloc

  sl.registerFactory<NamesBloc>(() => NamesBloc(
      fetchPassengerHistoryUseCase: sl<FetchPassengerHistoryUseCase>()));
  sl.registerFactory<ChooseLocationsBloc>(() => ChooseLocationsBloc());
  sl.registerFactory<CurrentLocationBloc>(() => CurrentLocationBloc());
}
