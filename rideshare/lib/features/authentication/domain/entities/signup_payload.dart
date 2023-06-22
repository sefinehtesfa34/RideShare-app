import 'dart:io';

import 'package:equatable/equatable.dart';

class SignupPayload extends Equatable {
  final String fullName;
  final int age;
  final String imageUrl;

  const SignupPayload({
    required this.fullName,
    required this.age,
    required this.imageUrl,
  });
  @override
  List<Object> get props => <Object>[fullName, age, imageUrl];
}
