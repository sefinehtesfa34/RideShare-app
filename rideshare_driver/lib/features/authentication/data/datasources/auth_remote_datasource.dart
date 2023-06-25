import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/user_profile.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/signup_payload.dart';
import '../models/signup_model.dart';
import '../models/user_profile_model.dart';

abstract class AuthRemoteDataSource {
  Future<bool> verifyOtp(String phoneNumber, String otp);
  Future<UserProfileModel> signup(SignupPayload model);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  static const String baseUrl =
      'https://648cc3d58620b8bae7ed5be2.mockapi.io/api/v1/auth';

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    try {
      final http.Response response =
          await http.get(Uri.parse('$baseUrl/verify/?otp=$otp'));
      return jsonDecode(response.body);
    } catch (e) {
      throw ServerException('Server failure');
    }
  }

  @override
  Future<UserProfileModel> signup(SignupPayload model) async {
    final SignupPayloadModel newModel = SignupPayloadModel(
      fullName: model.fullName,
      age: model.age,
      idImage: model.idImage,
      address: model.address,
      driverLicenseNumber: model.driverLicenseNumber,
      licenseImage: model.licenseImage,
      experienceYear: model.experienceYear,
    );
    final Map<String, dynamic> jsonBody = await newModel.toJson();
    final http.Response response = await client.post(
      Uri.parse("http://10.17.0.17:5000/signup"),
      body: json.encode(jsonBody),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw ServerException('Server failure');
    }
  }
}
