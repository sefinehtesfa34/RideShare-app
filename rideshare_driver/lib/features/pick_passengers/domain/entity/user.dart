class User {
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
    print("json");
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
}
