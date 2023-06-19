import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/signup_payload.dart';
import '../models/signup_model.dart';

abstract class AuthRemoteDataSource {
  Future<bool> verifyOtp(String phoneNumber, String otp);
  Future<SignupPayloadModel> signup(SignupPayload model);
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
  Future<SignupPayloadModel> signup(SignupPayload model) async {
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
    print("Strated");
    print("on");
    final http.Response response = await client.post(
      Uri.parse("http://10.2.0.2:5000/signup"),
      body: json.encode(jsonBody),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return SignupPayloadModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw ServerException('Server failure');
    }
  }
}
