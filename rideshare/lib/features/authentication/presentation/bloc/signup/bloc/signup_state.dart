import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends SignupState {}

class LoadingState extends SignupState {}

class SuccessState extends SignupState {}

class FailureState extends SignupState {}
