part of 'otp_bloc.dart';

abstract class OtpVerificationState extends Equatable {
  const OtpVerificationState();

  @override
  List<Object> get props => [];
}

class OtpVerificationInitial extends OtpVerificationState {}

class OtpVerificationLoading extends OtpVerificationState {}

class OtpSentSuccess extends OtpVerificationState {}

class OtpSentFailure extends OtpVerificationState {
  final String errorMessage;

  const OtpSentFailure(this.errorMessage);
}

class OtpVerificationSuccess extends OtpVerificationState {}

class OtpVerificationFailure extends OtpVerificationState {
  final String errorMessage;

  const OtpVerificationFailure(this.errorMessage);
}
