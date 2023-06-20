part of 'auth_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthBlocInitial extends AuthBlocState {}

class AuthBlocLoading extends AuthBlocState {}

class AuthBlocLoginSuccess extends AuthBlocState {
  final String phoneNumber;
  AuthBlocLoginSuccess({required this.phoneNumber});
}

class AuthBlocLoginFailure extends AuthBlocState {}
