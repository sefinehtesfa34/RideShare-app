part of 'otp_bloc.dart';

class OtpVerificationState {
  final bool isSignedUp;
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  const OtpVerificationState(
      {this.isFailure = false,
      this.isInitial = true,
      this.isLoading = false,
      this.isSignedUp = false,
      this.isSuccess = false});
  OtpVerificationState copyWith(
      {bool? isInitial,
      bool? isLoading,
      bool? isSuccess,
      bool? isFailure,
      bool? isSignedUp}) {
    return OtpVerificationState(
      isFailure: isFailure ?? this.isFailure,
      isInitial: isInitial ?? this.isInitial,
      isLoading: isLoading ?? this.isLoading,
      isSignedUp: isSignedUp ?? this.isSignedUp,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
