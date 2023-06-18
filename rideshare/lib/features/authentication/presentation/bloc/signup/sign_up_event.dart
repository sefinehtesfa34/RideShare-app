part of 'sign_up_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  final String fullName;
  final int age;
  final File idImage;

  const AuthenticationEvent(
      {required this.fullName, required this.age, required this.idImage});
}

class SignUpEvent extends AuthenticationEvent {
  const SignUpEvent({
    required super.fullName,
    required super.age,
    required super.idImage,
  });
}
