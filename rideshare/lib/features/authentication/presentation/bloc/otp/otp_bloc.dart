import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import 'package:rideshare/features/authentication/domain/usecases/verify_otp.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final OtpVerificationUseCase useCase;
  OtpVerificationBloc({required this.useCase})
      : super(const OtpVerificationState()) {
    on<VerifyOtpEvent>(
      (VerifyOtpEvent event, Emitter<OtpVerificationState> emit) async {
        emit(state.copyWith(isLoading: true));
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        try {
          final Either<Failure, VerifyOtpModel> successOrFailure =
              await useCase.call(event.phoneNumber);
          
          if (successOrFailure.isRight()) {
            VerifyOtpModel verifyOtpModel = successOrFailure
                .getOrElse(() => throw ServerException('Server Failure'));
            String jsonString = jsonEncode(verifyOtpModel.toJson());
            Map<String, dynamic> json = jsonDecode(jsonString);
            if (json['otp'] == event.otp) {
              if (json['signedUp']) {
                emit(state.copyWith(isSignedUp: true, isSuccess: true));
              } else {
                emit(state.copyWith(isSignedUp: false, isSuccess: true));
              }
            } else {
              emit(state.copyWith(isFailure: true));
            }
          }
        } catch (e) {
          emit(state.copyWith(isFailure: true));
        }
      },
    );
  }
}
