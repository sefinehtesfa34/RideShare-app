import 'dart:io';

import 'package:equatable/equatable.dart';

class SignupPayload extends Equatable {
  final String fullName;
  final int age;
  final File? imageId;
  final String phoneNumber;
  final String id;
  final String name;

  const SignupPayload({
    required this.name,
    required this.id,
    required this.fullName,
    required this.age,
    this.imageId,
    required this.phoneNumber,
  });
  @override
  List<Object> get props => <Object>[fullName, age, phoneNumber, id, name];
}
