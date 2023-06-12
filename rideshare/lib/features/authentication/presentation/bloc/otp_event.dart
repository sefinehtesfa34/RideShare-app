part of 'otp_bloc.dart';

abstract class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends OtpVerificationEvent {
  final String email;
  const SendOtpEvent({required this.email});
}

class VerifyOtpEvent extends OtpVerificationEvent {
  final String email;
  final String otp;
  const VerifyOtpEvent({required this.email, required this.otp});
}
