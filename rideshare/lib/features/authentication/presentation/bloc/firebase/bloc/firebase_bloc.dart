import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/errors/failures.dart' show Failure;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/cache/firebase_cache.dart';
import '../../../../domain/usecases/firebase_usecase.dart';
import 'firebase_event.dart';
import 'firebase_state.dart';

final CacheManager cacheManager = CacheManager(
  sharedPreferencesFuture: SharedPreferences.getInstance(),
);

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;

  FirebaseBloc({
    required this.sendOtpUsecase,
    required this.verifyOtpUsecase,
  }) : super(FirebaseState(status: FirebaseOtpStatus.initial)) {
    on<SendOTPEvent>((SendOTPEvent event, Emitter<FirebaseState> emit) async {
      emit(FirebaseState(status: FirebaseOtpStatus.loading));

      await Future<dynamic>.delayed(const Duration(seconds: 2));
      try {
        final Either<Failure, String> result =
            await sendOtpUsecase(event.phoneNumber);
        result.fold(
          (Failure failure) => emit(state.copyWith(
              status: FirebaseOtpStatus.failure,
              errorMessage: failure.toString())),
          (String verificationId) async {
            emit(state.copyWith(
                status: FirebaseOtpStatus.success,
                verificationId: verificationId));

            final SharedPreferences sharedPreferences =
                await cacheManager.sharedPreferences;

            await sharedPreferences.setString('verificationId', verificationId);
          },
        );
      } catch (e) {
        emit(state.copyWith(status: FirebaseOtpStatus.failure));
      }
    });
    on<VerifyOTPEvent>(
        (VerifyOTPEvent event, Emitter<FirebaseState> emit) async {
      emit(FirebaseState(status: FirebaseOtpStatus.loading));

      final SharedPreferences sharedPreferences =
          await cacheManager.sharedPreferences;
      emitFailure() {
        emit(state.copyWith(
          status: FirebaseOtpStatus.failure,
          errorMessage: 'Invalid OTP',
        ));
      }

      emitSuccess() async {
        final String verificationId =
            sharedPreferences.getString('verificationId') ?? '';
        emit(state.copyWith(
          status: FirebaseOtpStatus.success,
          verificationId: verificationId,
        ));
      }
      try {
        final String verificationId =
            sharedPreferences.getString('verificationId') ?? '';

        final Either<Failure, void> response = await verifyOtpUsecase.call(
          Params(otp: event.otp, verificationId: verificationId),
        );

        response.fold(
          (Failure failure) => emitFailure(),
          (void success) async => await emitSuccess(),
        );
      } catch (e) {
        emit(state.copyWith(status: FirebaseOtpStatus.failure));
      }
    });
  }
}
