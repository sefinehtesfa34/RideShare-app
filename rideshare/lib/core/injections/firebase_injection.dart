import 'package:firebase_auth/firebase_auth.dart';
import 'package:rideshare/features/authentication/data/datasources/firebase_datasource.dart';
import 'package:rideshare/features/authentication/data/repositories/firebase_repository.dart';
import 'package:rideshare/features/authentication/domain/repositories/firebase_repository.dart';
import 'package:rideshare/features/authentication/domain/usecases/firebase_usecase.dart';
import '../../features/authentication/presentation/bloc/firebase/bloc/firebase_bloc.dart';
import 'injection_container.dart';

Future<void> firebaseInjectionInit() async {
  //!Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  //! Bloc
  sl.registerFactory(
      () => FirebaseBloc(sendOtpUsecase: sl(), verifyOtpUsecase: sl()));
  //! usecases
  sl.registerLazySingleton(() => SendOtpUsecase(firebaseOtpRepository: sl()));
  sl.registerLazySingleton(() => VerifyOtpUsecase(firebaseOtpRepository: sl()));
  //! Repositories
  sl.registerLazySingleton<FirebaseOtpRepository>(
      () => FirebaseOtpRepositoryImpl(dataSource: sl()));
  //! Datasource
  sl.registerLazySingleton<FirebaseDataSource>(
      () => FirebaseDataSourceImpl(firebaseAuth: sl()));
}
