import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        emit(OtpVerificationLoading());
        // ignore: always_specify_types
        await Future.delayed(const Duration(seconds: 2));
        // final response = await useCase.call(Params(
        //   phoneNumber: event.phoneNumber,
        //   otp: event.otp,
        // ));
        // emit(_verify(response));
        emit(OtpVerificationSuccess());
        // emit(OtpVerificationFailure());
      },
    );
  }
  _verify(response) async {
    return OtpVerificationSuccess();
  }
}
