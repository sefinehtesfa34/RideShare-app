import 'package:equatable/equatable.dart';

class Passenger extends Equatable {
  final String? fullName;
  final String? phoneNumber;
  final int? age;
  const Passenger({this.age, this.fullName, this.phoneNumber});
  @override
  List<Object?> get props => <Object?>[age, fullName];
}
