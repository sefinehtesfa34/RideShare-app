enum FirebaseOtpStatus {
  initial,
  loading,
  success,
  failure,
}

class FirebaseState {
  final FirebaseOtpStatus status;
  final String? verificationId;
  final String? errorMessage;
  final bool isSignedUp;

  FirebaseState({
    this.status = FirebaseOtpStatus.initial,
    this.isSignedUp = false,
    this.verificationId,
    this.errorMessage,
  });

  FirebaseState copyWith({
    FirebaseOtpStatus? status,
    String? verificationId,
    String? errorMessage,
    bool? isSignedUp,
  }) {
    return FirebaseState(
      isSignedUp: isSignedUp ?? this.isSignedUp,
      status: status ?? this.status,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
