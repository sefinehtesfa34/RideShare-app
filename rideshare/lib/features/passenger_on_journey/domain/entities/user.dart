/// User Entity
///
/// Represents a user profile with details such as full name, image URL,
/// phone number, and age.
class User {
  /// The full name of the user.
  final String fullname;

  /// The URL to the user's profile image.
  final String imageUrl;

  /// The phone number of the user.
  final String phoneNumber;

  /// The age of the user.
  final int age;

  /// Constructs a [User] instance with the provided details.
  User({
    required this.fullname,
    this.imageUrl =
        "https://img.freepik.com/free-icon/user_318-563642.jpg?w=360",
    required this.phoneNumber,
    required this.age,
  });

  /// Factory constructor to create a [User] instance from JSON data.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname: json['fullName'],
      imageUrl: json['profilePicture'] ??
          "https://img.freepik.com/free-icon/user_318-563642.jpg?w=360",
      phoneNumber: json['phoneNumber'],
      age: json['age'],
    );
  }

  /// Converts the user details to JSON format.
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullname,
      'profilePicture': imageUrl,
      'phoneNumber': phoneNumber,
      'age': age,
    };
  }
}
