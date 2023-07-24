import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/network_info.dart';
import 'auth_injection.dart';
import 'location_injection.dart';
import 'pick_passenger_injection.dart';
import 'ride_request_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User
  await authInjectionInit();
  locationInjectionInit();
  RideRequestInjectionInit();
  PickPassengersInit();

  //! External
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
