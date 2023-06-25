import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/usecases/verify_otp.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final OtpVerificationUseCase useCase;
  OtpBloc({required this.useCase}) : super(OtpVerificationInitial()) {
    on<VerifyOtpEvent>(
      (VerifyOtpEvent event, Emitter<OtpVerificationState> emit) async {
        emit(OtpVerificationLoading());
        final dynamic response = useCase
            .call(Params(phoneNumber: event.phoneNumber, otp: event.otp));
        emit(_verify(response));
      },
    );
  }
  _verify(dynamic response) {
    // ignore: always_specify_types
    return response.fold((failure) => const ServerFailure('Server Failure'),
        // ignore: always_specify_types
        (result) {
      if (result == true) {
        return OtpVerificationSuccess();
      }
      return const OtpVerificationFailure('Wrong OTP!');
    });
  }
}
