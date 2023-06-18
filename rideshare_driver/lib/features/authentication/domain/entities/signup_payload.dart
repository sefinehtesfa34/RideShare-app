import 'dart:io';

import 'package:equatable/equatable.dart';

class SignupPayload extends Equatable {
  final String fullName;
  final int age;
  final File idImage;

  const SignupPayload({
    required this.fullName,
    required this.age,
    required this.idImage,
  });
  @override
  List<Object> get props => <Object>[fullName, age, idImage];
}
