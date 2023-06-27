import 'package:http/http.dart' as http;
import 'package:rideshare/features/profile/data/datasource/remote_datasource.dart';
import 'package:rideshare/features/profile/data/repository/passenger_repository.dart';
import 'package:rideshare/features/profile/domain/repository/passenger_repository.dart';
import 'package:rideshare/features/profile/presentation/bloc/fetch_passenger/bloc/fetch_passenger_bloc.dart';
import '../../features/profile/domain/usecase/passenger_usecase.dart';
import '../../features/profile/presentation/bloc/update_passenger/update_profile_bloc.dart';
import 'injection_container.dart';

Future<void> profileInjection() async {
  // Register the OTPVerificationRepository implementation
  sl.registerLazySingleton<PassengerRepository>(
    () => PassengerRepositoryImpl(
        passengerRemoteDataSource: sl<PassengerRemoteDataSource>()),
  );

  // Register the UserDataSource implementation
  sl.registerLazySingleton<PassengerRemoteDataSource>(
    () => PassengerRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  // Register the OtpVerificationUseCase
  sl.registerLazySingleton<UpdatePassengerProfileUsecase>(
    () => UpdatePassengerProfileUsecase(passengerRepository: sl()),
  );
  sl.registerLazySingleton<GetPassengerUsecase>(
    () => GetPassengerUsecase(passengerRepository: sl()),
  );
  // Register the OtpVerificationBloc

  sl.registerFactory<UpdateProfileBloc>(() => UpdateProfileBloc(usecase: sl()));
  sl.registerFactory<FetchPassengerBloc>(() => FetchPassengerBloc(usecase: sl()));
}
