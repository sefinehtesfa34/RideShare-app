import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String fullname;
  final String? imageUrl;
  final String phoneNumber;
  final int age;

  User({
    required this.fullname,
    this.imageUrl,
    required this.phoneNumber,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname: json['fullName'],
      imageUrl: json['profilePicture'] ??
          "https://ca.slack-edge.com/T046DJBFEMD-U04GG93EFPG-0e0861ae44ed-512",
      phoneNumber: json['phoneNumber'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'profilePicture': imageUrl,
      'phoneNumber': phoneNumber,
      'age': age,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [fullname, imageUrl, phoneNumber, age];
}

/**
 * `User` is a class that represents a user in the system.
 *
 * It extends the `Equatable` class to allow for value comparison.
 *
 * Properties:
 * - `fullname`: The full name of the user.
 * - `imageUrl`: The URL of the user's profile picture. It is nullable and has a default value.
 * - `phoneNumber`: The phone number of the user.
 * - `age`: The age of the user.
 *
 * The class has a constructor which requires `fullname`, `phoneNumber`, and `age` to be passed, while `imageUrl` is optional.
 *
 * It also includes two methods for JSON serialization and deserialization:
 * - `fromJson(Map<String, dynamic> json)`: A factory constructor that creates a `User` instance from a map.
 * - `toJson()`: A method that converts the `User` instance into a map.
 *
 * The `props` getter is used for value comparison.
 */