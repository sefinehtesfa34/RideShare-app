import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart'; // Import this to use join function
import 'package:rideshare/features/authentication/data/models/signup_model.dart';

void main() {
  test('toJson should return a valid JSON map', () async {
    final temporaryDirectory = Directory.systemTemp;
    final idImagePath = join(temporaryDirectory.path, 'id_image.jpg');
    final licenseImagePath = join(temporaryDirectory.path, 'license_image.jpg');


    final idImageBytes = await File(idImagePath)
        .writeAsBytes([1, 2, 3]); 
    final licenseImageBytes = await File(licenseImagePath)
        .writeAsBytes([4, 5, 6]); 

    final model = SignupPayloadModel(
      fullName: 'John Doe',
      age: 25,
      idImage: idImageBytes,
      address: '123 Main St',
      driverLicenseNumber: 1237,
      licenseImage: licenseImageBytes,
      experienceYear: 3,
    );

    final json = await model.toJson();

    expect(json, isA<Map<String, dynamic>>());
    expect(json['fullName'], model.fullName);
    expect(json['age'], model.age);
    expect(json['idImage'], model.idImage.readAsBytesSync()); // Check bytes instead of the File instance
    expect(json['address'], model.address);
    expect(json['driverLicenseNumber'], model.driverLicenseNumber);
    expect(json['licenseImage'], model.licenseImage.readAsBytesSync()); // Check bytes instead of the File instance
    expect(json['experienceYear'], model.experienceYear);
  });
}
