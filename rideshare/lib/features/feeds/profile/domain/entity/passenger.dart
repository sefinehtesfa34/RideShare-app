import 'package:equatable/equatable.dart';

class Passenger extends Equatable {
  final String? fullName;
  final int? age;
  const Passenger({this.age, this.fullName});
  @override
  List<Object?> get props => <Object?>[age, fullName];
}
