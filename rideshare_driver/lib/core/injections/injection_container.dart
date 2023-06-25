import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'auth_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User
  await authInjectionInit();

  //! External
  sl.registerLazySingleton(() => http.Client());
}
