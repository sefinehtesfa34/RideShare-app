import 'dart:io';

import 'package:equatable/equatable.dart';

class SignupPayload extends Equatable {
  final String fullName;
  final String phoneNumber;
  final int age;
  final String sex;
  final File id;

  const SignupPayload({
    required this.fullName,
    required this.phoneNumber,
    required this.sex,
    required this.age,
    required this.id,
  });
  @override
  List<Object> get props => <Object>[fullName, phoneNumber, sex, age, id];
}
