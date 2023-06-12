part of 'auth_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthBlocInitial extends AuthBlocState {}

class AuthBlocLoading extends AuthBlocState {}

class AuthBlocLoginSuccess extends AuthBlocState {
  final LoginPayload authentication;
  AuthBlocLoginSuccess({required this.authentication});
}

class AuthBlocLoginFailure extends AuthBlocState {}
