import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SubmitEvent extends LoginEvent {
  final String phoneNumber;
  const SubmitEvent({required this.phoneNumber});
}
