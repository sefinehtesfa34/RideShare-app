part of 'otp_bloc.dart';

abstract class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends OtpVerificationEvent {
  final String phoneNumber;
  const SendOtpEvent({required this.phoneNumber});
}

class VerifyOtpEvent extends OtpVerificationEvent {
  final String phoneNumber;
  final String otp;
  const VerifyOtpEvent({required this.phoneNumber, required this.otp});
}
