import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:rideshare/features/feeds/location/data/datasource/remote_location_data.dart';
import 'package:rideshare/features/feeds/location/data/repository/location_repository.dart';
import 'package:rideshare/features/feeds/location/domain/repository/location_repository.dart';
import 'package:rideshare/features/feeds/location/domain/usecase/location_usecase.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/verify_otp.dart';
import 'features/authentication/presentation/bloc/otp_bloc.dart';

final GetIt getIt = GetIt.instance;

void locationInjectionInit() {
  // Register the HTTP client

  // Register the UserDataSource implementationR

  // Register the OTPVerificationRepository implementation
  getIt.registerLazySingleton<OTPVerificationRepository>(
    () => OTPVerificationRepositoryImpl(
        userDataSource: getIt<AuthRemoteDataSource>()),
  );

  // Register the OtpVerificationUseCase
  getIt.registerLazySingleton<OtpVerificationUseCase>(
    () => OtpVerificationUseCase(
        otpVerificationRepository: getIt<OTPVerificationRepository>()),
  );
  // Register the OtpVerificationBloc
  getIt.registerFactory<OtpVerificationBloc>(
    () => OtpVerificationBloc(useCase: getIt<OtpVerificationUseCase>()),
  );

  // Register the UserDataSource implementation
  getIt.registerLazySingleton<RemoteLocationDataSource>(
    () => RemoteLocationDataSourceImpl(client: getIt<http.Client>()),
  );

  // Register the OTPVerificationRepository implementation
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
        remoteLocationDataSource: getIt<RemoteLocationDataSource>()),
  );

  // Register the OtpVerificationUseCase
  getIt.registerLazySingleton<GetLocationUsecase>(
    () => GetLocationUsecase(locationRepository: getIt<LocationRepository>()),
  );
  getIt.registerLazySingleton<PostLocationUsecase>(
    () => PostLocationUsecase(locationRepository: getIt<LocationRepository>()),
  );
  // Register the OtpVerificationBloc
  getIt.registerFactory<LocationBloc>(
    () => LocationBloc(
        getUsecase: getIt<GetLocationUsecase>(),
        postLocationUsecase: getIt<PostLocationUsecase>()),
  );
  getIt.registerFactory<BackToLocationBloc>(
    () => BackToLocationBloc(),
  );
}
