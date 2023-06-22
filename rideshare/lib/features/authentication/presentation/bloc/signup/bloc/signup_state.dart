import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final String fullName;
  final String imageUrl;
  final int age;
  final String phoneNumber;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  const SignupState({
    this.isFailure = false,
    this.isSuccess = false,
    this.isLoading = false,
    this.imageUrl = '',
    this.fullName = '',
    this.age = 0,
    this.phoneNumber = '',
  });

  SignupState copyWith({
    String? fullName,
    String? imageUrl,
    int? age,
    String? phoneNumber,
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isFailure: isFailure ?? this.isFailure,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [fullName, age, phoneNumber];
}
