import 'package:equatable/equatable.dart';

class SignupPayload extends Equatable {
  final String fullName;
  final String phoneNumber;

  const SignupPayload({required this.fullName, required this.phoneNumber});
  @override
  List<Object> get props => [fullName, phoneNumber];
}
