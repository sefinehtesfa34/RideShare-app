enum FirebaseOtpStatus {
  initial,
  loading,
  success,
  failure,
}

class FirebaseOtpState {
  final FirebaseOtpStatus status;
  final String? verificationId;
  final String? errorMessage;

  FirebaseOtpState({
    required this.status,
    this.verificationId,
    this.errorMessage,
  });

  FirebaseOtpState copyWith({
    FirebaseOtpStatus? status,
    String? verificationId,
    String? errorMessage,
  }) {
    return FirebaseOtpState(
      status: status ?? this.status,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
