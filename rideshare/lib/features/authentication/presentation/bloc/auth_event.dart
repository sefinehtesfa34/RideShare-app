part of 'auth_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthBlocEvent {
  final String phoneNumber;
  const LoginEvent({required this.phoneNumber});
}

// class SignupEvent extends AuthBlocEvent {
//   final SignupPayload newAuthCredentials;

//   SignupEvent({required this.newAuthCredentials});
// }
