import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String fullname;
  final String imageUrl;
  final String phoneNumber;
  final int age;

  User({
    required this.fullname,
    required this.imageUrl,
    required this.phoneNumber,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname: json['fullname'],
      imageUrl: json['imageUrl'],
      phoneNumber: json['phoneNumber'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'age': age,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [fullname, imageUrl, phoneNumber, age];
}
