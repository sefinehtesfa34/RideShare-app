import 'package:equatable/equatable.dart';

class LoginPayload extends Equatable {
  final String phoneNumber;

  const LoginPayload({required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}
