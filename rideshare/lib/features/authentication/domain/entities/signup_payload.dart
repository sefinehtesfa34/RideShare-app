import 'package:equatable/equatable.dart';

class SignupPayload extends Equatable {
  final String fullName;
  final String phoneNumber;
  final int age;
  final String sex;

  const SignupPayload({
    required this.fullName,
    required this.phoneNumber,
    required this.sex,
    required this.age,
  });
  @override
  List<Object> get props => [fullName, phoneNumber, sex, age];
}
