abstract class FirebaseEvent {}

class SendOTPEvent extends FirebaseEvent {
  final String phoneNumber;

  SendOTPEvent({required this.phoneNumber});
}

class VerifyOTPEvent extends FirebaseEvent {
  final String otp;

  VerifyOTPEvent({required this.otp});
}