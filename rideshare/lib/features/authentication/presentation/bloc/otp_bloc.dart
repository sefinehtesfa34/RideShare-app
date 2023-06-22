import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/domain/usecases/verify_otp.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final OtpVerificationUseCase useCase;
  OtpVerificationBloc({required this.useCase})
      : super(OtpVerificationInitial()) {
    on<VerifyOtpEvent>(
      (VerifyOtpEvent event, Emitter<OtpVerificationState> emit) async {
        try {
          final Either<Failure, String> response = await useCase.call(Params(
            phoneNumber: event.phoneNumber,
            otp: event.otp,
          ));

          // ignore: always_specify_types, unrelated_type_equality_checks
          if (Right(event.otp) != response) {
            return emit(OtpVerificationFailure());
          }
          return emit(OtpVerificationSuccess());
        } catch (e) {
          return emit(OtpVerificationFailure());
        }
      },
    );
  }
  // _verify(String response, String otp) async {
  //   return OtpVerificationSuccess();
  // }
}
