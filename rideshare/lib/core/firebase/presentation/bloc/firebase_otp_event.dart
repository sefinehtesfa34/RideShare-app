abstract class OTPVerificationEvent {}

class SendOTPEvent extends OTPVerificationEvent {
  final String phoneNumber;
  final String verificationId;

  SendOTPEvent({required this.phoneNumber, required this.verificationId});
}

class VerifyOTPEvent extends OTPVerificationEvent {
  final String verificationId;
  final String otp;

  VerifyOTPEvent({required this.verificationId, required this.otp});
}
