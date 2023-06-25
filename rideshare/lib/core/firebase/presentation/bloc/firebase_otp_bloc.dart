import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/firebase/domain/usecase/otp_usecase.dart';

import 'firebase_otp_event.dart';
import 'firebase_otp_state.dart';

class FirebaseOtpBloc extends Bloc<OTPVerificationEvent, FirebaseOtpState> {
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;

  FirebaseOtpBloc({
    required this.sendOtpUsecase,
    required this.verifyOtpUsecase,
  }) : super(FirebaseOtpState(status: FirebaseOtpStatus.initial)) {
    on<SendOTPEvent>(
        (SendOTPEvent event, Emitter<FirebaseOtpState> emit) async {
      emit(FirebaseOtpState(status: FirebaseOtpStatus.loading));
      await Future<dynamic>.delayed(const Duration(seconds: 2));
      final Either<Failure, String> result =
          await sendOtpUsecase(event.phoneNumber);
      result.fold(
        (Failure failure) => emit(state.copyWith(
            status: FirebaseOtpStatus.failure,
            errorMessage: failure.toString())),
        (String verificationId) => emit(state.copyWith(
            status: FirebaseOtpStatus.success, verificationId: verificationId)),
      );
    });
    on<VerifyOTPEvent>(
        (VerifyOTPEvent event, Emitter<FirebaseOtpState> emit) async {
      emit(FirebaseOtpState(status: FirebaseOtpStatus.loading));
      await Future<dynamic>.delayed(const Duration(seconds: 2));
      final Either<Failure, void> response = await verifyOtpUsecase.call(Params(
          otp: event.otp,
          verificationId: state.verificationId ?? 'verificationId'));
      response.fold(
          (Failure failure) => emit(state.copyWith(
              status: FirebaseOtpStatus.failure, errorMessage: 'Invalid OTP')),
          (void success) => emit(state.copyWith(
              status: FirebaseOtpStatus.success,
              verificationId: state.verificationId)));
    });
  }
}
