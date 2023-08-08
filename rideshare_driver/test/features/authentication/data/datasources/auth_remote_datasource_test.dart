import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import 'package:rideshare/features/authentication/data/models/user_profile_model.dart';
import 'package:path/path.dart'; // Import this to use join function

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = AuthRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('verifyOtp', () {
    test('should return true if the OTP is valid', () async {
      // Arrange
      final phoneNumber = '1234567890';
      final otp = '123456';
      final responseJson = true;
      final response = http.Response('{"result": $responseJson}', 200);

      when(mockHttpClient
              .get(Uri.parse('https://example.com/verify/?otp=$otp')))
          .thenAnswer((_) async => response);

      // Act
      final result = await dataSource.verifyOtp(phoneNumber, otp);

      // Assert
      expect(result, true);
      verify(mockHttpClient
          .get(Uri.parse('https://example.com/verify/?otp=$otp')));
    });

    test('should throw a ServerException if the API call fails', () async {
      // Arrange
      final phoneNumber = '1234567890';
      final otp = '123456';

      when(mockHttpClient
              .get(Uri.parse('https://example.com/verify/?otp=$otp')))
          .thenAnswer((_) async => http.Response('Error', 500));

      // Act & Assert
      expect(() async => await dataSource.verifyOtp(phoneNumber, otp),
          throwsA(isInstanceOf<ServerException>()));
      verify(mockHttpClient
          .get(Uri.parse('https://example.com/verify/?otp=$otp')));
    });
  });

  group('signup', () {
    test('should return a UserProfileModel if signup is successful', () async {
      final temporaryDirectory = Directory.systemTemp;
      final idImagePath = join(temporaryDirectory.path, 'id_image.jpg');
      final licenseImagePath =
          join(temporaryDirectory.path, 'license_image.jpg');

      final idImageBytes = await File(idImagePath).writeAsBytes([1, 2, 3]);
      final licenseImageBytes =
          await File(licenseImagePath).writeAsBytes([4, 5, 6]);

      final model = SignupPayloadModel(
        fullName: 'John Doe',
        age: 25,
        idImage: idImageBytes,
        address: '123 Main St',
        driverLicenseNumber: 1237,
        licenseImage: licenseImageBytes,
        experienceYear: 3,
      ); // Arrange

      final responseJson = {
        "fullName": "John Doe",
        "age": 25,
        "idImage": "id_image.jpg",
        "address": "123 Main St",
        "driverLicenseNumber": 1237,
        "licenseImage": "license_image.jpg",
        "experienceYear": 3
      };
      final response =
          http.Response('{"result": ${jsonEncode(responseJson)}}', 200);
      when(mockHttpClient.post(
        Uri.parse(
            'http://10.17.0.17:5000/signup'), // replace 'any' with a valid URL string
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => response);

      // Act
      final result = await dataSource.signup(model);

      // Assert
      expect(result, isA<UserProfileModel>());
      // Add more assertions based on the expected response JSON
      verify(mockHttpClient.post(
        Uri.parse('http://10.17.0.17:5000/signup'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ));
    });

    test('should throw a ServerException if signup fails', () async {
      // Arrange
      final temporaryDirectory = Directory.systemTemp;
      final idImagePath = join(temporaryDirectory.path, 'id_image.jpg');
      final licenseImagePath =
          join(temporaryDirectory.path, 'license_image.jpg');

      final idImageBytes = await File(idImagePath).writeAsBytes([1, 2, 3]);
      final licenseImageBytes =
          await File(licenseImagePath).writeAsBytes([4, 5, 6]);

      final model = SignupPayloadModel(
        fullName: 'John Doe',
        age: 25,
        idImage: idImageBytes,
        address: '123 Main St',
        driverLicenseNumber: 1237,
        licenseImage: licenseImageBytes,
        experienceYear: 3,
      ); // Arrange

      when(mockHttpClient.post(
        Uri.parse('http://10.17.0.17:5000/signup'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Error', 500));

      // Act & Assert
      expect(() async => await dataSource.signup(model),
          throwsA(isInstanceOf<ServerException>()));
      verify(mockHttpClient.post(
        Uri.parse('http://10.17.0.17:5000/signup'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ));
    });
  });
}
