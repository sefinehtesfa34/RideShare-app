import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rideshare/features/feeds/profile/data/datasource/remote_datasource.dart';
import 'package:rideshare/features/feeds/profile/data/repository/passenger_repository.dart';
import 'package:rideshare/features/feeds/profile/domain/repository/passenger_repository.dart';
import 'package:rideshare/features/feeds/profile/presentation/bloc/update_profile_bloc.dart';
import 'features/feeds/profile/domain/usecase/passenger_usecase.dart';

final GetIt getIt = GetIt.instance;

Future<void> passengerProfileInjection() async {
  // Register the HTTP client

  // Register the Passenger Remote data source implementationR
  getIt.registerLazySingleton<PassengerRemoteDataSource>(
    () => PassengerRemoteDataSourceImpl(client: getIt<http.Client>()),
  );

  // Register the OTPVerificationRepository implementation
  getIt.registerLazySingleton<PassengerRepository>(
    () => PassengerRepositoryImpl(
        passengerRemoteDataSource: getIt<PassengerRemoteDataSource>()),
  );

  // Register the OtpVerificationUseCase
  getIt.registerLazySingleton<UpdatePassengerProfileUsecase>(
    () => UpdatePassengerProfileUsecase(
        passengerRepository: getIt<PassengerRepository>()),
  );
  // Register the OtpVerificationBloc
  getIt.registerFactory<UpdateProfileBloc>(
    () => UpdateProfileBloc(usecase: getIt<UpdatePassengerProfileUsecase>()),
  );
}
