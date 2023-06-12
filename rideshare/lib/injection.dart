import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/authentication/data/datasources/user_datasource.dart';
import 'features/authentication/data/repository/user_repository.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/verify_otp.dart';
import 'features/authentication/presentation/bloc/otp_bloc.dart';

final GetIt getIt = GetIt.instance;

void init() {
  // Register the HTTP client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Register the UserDataSource implementation
  getIt.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(client: getIt<http.Client>()),
  );

  // Register the OTPVerificationRepository implementation
  getIt.registerLazySingleton<OTPVerificationRepository>(
    () =>
        OTPVerificationRepositoryImpl(userDataSource: getIt<UserDataSource>()),
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
}
