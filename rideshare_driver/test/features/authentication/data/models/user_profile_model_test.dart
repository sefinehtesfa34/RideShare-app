import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/authentication/data/models/user_profile_model.dart';

void main() {
  group('UserProfileModel', () {
    test('fromJson should return a valid UserProfileModel instance', () {
      // Arrange
      final json = {
        'fullName': 'John Doe',
        'age': 30,
        'idImage': 'path/to/id_image.jpg',
        'address': '123 Main St',
        'driverLicenseNumber': 1234567890,
        'licenseImage': 'path/to/license_image.jpg',
        'experienceYear': 5,
      };

      // Act
      final userProfileModel = UserProfileModel.fromJson(json);

      // Assert
      expect(userProfileModel.fullName, 'John Doe');
      expect(userProfileModel.age, 30);
      expect(userProfileModel.idImage, 'path/to/id_image.jpg');
      expect(userProfileModel.address, '123 Main St');
      expect(userProfileModel.driverLicenseNumber, 1234567890);
      expect(userProfileModel.licenseImage, 'path/to/license_image.jpg');
      expect(userProfileModel.experienceYear, 5);
    });
  });
}