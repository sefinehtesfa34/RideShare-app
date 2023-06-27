import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => <Object>[];
}

class SubmitSignupEvent extends SignupEvent {
  final String fullName;
  final int age;
  final String name;
  final String commuterId;
  const SubmitSignupEvent({
    required this.age,
    required this.commuterId,
    required this.name,
    required this.fullName,
  });
}
