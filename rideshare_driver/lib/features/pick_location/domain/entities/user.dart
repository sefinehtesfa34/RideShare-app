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

/**
 * `User` is a class that represents a user entity in the application.
 * It extends the `Equatable` class to allow for value comparison.
 *
 * Properties:
 * - `fullname`: A string representing the full name of the user.
 * - `imageUrl`: A string representing the URL of the user's image.
 * - `phoneNumber`: A string representing the user's phone number.
 * - `age`: An integer representing the user's age.
 *
 * Constructor:
 * The `User` constructor requires all properties to be passed as arguments.
 *
 * Factory constructor:
 * - `fromJson(Map<String, dynamic> json)`: A factory constructor that creates a `User` instance from a map.
 *
 * Methods:
 * - `toJson()`: Returns a map with the `User` instance's properties as key-value pairs.
 * - `props`: Overrides the `props` getter from `Equatable` to provide a list of properties used for value comparison.
 */