class User {
  final String fullname;
  final String imageUrl;
  final String phoneNumber;
  final int age;

  User({
    required this.fullname,
    this.imageUrl =
        "https://img.freepik.com/free-icon/user_318-563642.jpg?w=360",
    required this.phoneNumber,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname: json['fullName'],
      imageUrl: json['profilePicture'] ?? "https://img.freepik.com/free-icon/user_318-563642.jpg?w=360",
      phoneNumber: json['phoneNumber'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullname,
      'profilePicture': imageUrl,
      'phoneNumber': phoneNumber,
      'age': age,
    };
  }
}
