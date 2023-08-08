import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/domain/entities/user.dart';

void main() {
  final testUser = User(
    fullname: 'Test User',
    imageUrl: 'http://example.com/image.jpg',
    phoneNumber: '1234567890',
    age: 30,
  );

  group('User', () {
    test('should be created from JSON', () {
      final Map<String, dynamic> json = {
        'fullname': 'Test User',
        'imageUrl': 'http://example.com/image.jpg',
        'phoneNumber': '1234567890',
        'age': 30,
      };

      expect(User.fromJson(json), testUser);
    });

    test('should convert to JSON', () {
      final Map<String, dynamic> json = {
        'fullname': 'Test User',
        'imageUrl': 'http://example.com/image.jpg',
        'phoneNumber': '1234567890',
        'age': 30,
      };

      expect(testUser.toJson(), json);
    });
  });
}