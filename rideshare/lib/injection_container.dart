import 'package:get_it/get_it.dart';
import 'package:rideshare/auth_injection.dart';
import 'package:http/http.dart' as http;

import 'location_injection.dart';
import 'package:rideshare/ride_request_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User
  await authInjectionInit();
  //! Features - Location
  locationInjectionInit();

  //! Features - RideRequest
  await RideRequestInjectionInit();

  //! External
  sl.registerLazySingleton(() => http.Client());
}
