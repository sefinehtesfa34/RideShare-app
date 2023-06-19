part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpFailed extends SignUpState {
  final String error;
  SignUpFailed(this.error);
}

class SignUpSuccess extends SignUpState {
  final UserProfile profile;
  SignUpSuccess(this.profile);
}
