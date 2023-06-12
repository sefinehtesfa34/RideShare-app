part of 'auth_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthBlocEvent {
  final LoginPayload authCredentials;

  const LoginEvent({required this.authCredentials});
  @override
  List<Object> get props => [authCredentials];
}

class SignupEvent extends AuthBlocEvent {
  final SignupPayload newAuthCredentials;

  SignupEvent({required this.newAuthCredentials});

  @override
  List<Object> get props => [newAuthCredentials];
}
